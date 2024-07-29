import Foundation
import AffiseAttributionLib

internal class CheckStatusUseCaseImpl {
    
    private static let TIME_DELAY_SENDING: TimeInterval = 5
    private let ATTEMPTS_TO_SEND = 30
    private let TIMEOUT_SEND: TimeInterval = 30
    
    let PATH: String = "check_status"
    var url: String = ""
    var isPostBackSend: Bool = false

    let logsManager: LogsManager?
    let converter: ProvidersToJsonStringConverter
    let keyValueConverter: StringToKeyValueConverter
    let networkService: NetworkService
    let postBackModelFactory: PostBackModelFactory
    let postBackModelToJsonStringConverter: PostBackModelToJsonStringConverter
    
    let providers: [Provider]

    init(
        affiseModule: AffiseModule,
        logsManager: LogsManager?,
        networkService: NetworkService,
        converter: ProvidersToJsonStringConverter,
        keyValueConverter: StringToKeyValueConverter,
        postBackModelFactory: PostBackModelFactory,
        postBackModelToJsonStringConverter: PostBackModelToJsonStringConverter
    ) {
        self.logsManager = logsManager
        self.converter = converter
        self.keyValueConverter = keyValueConverter
        self.networkService = networkService
        self.postBackModelFactory = postBackModelFactory
        self.postBackModelToJsonStringConverter = postBackModelToJsonStringConverter
        self.providers = affiseModule.getRequestProviders()
        
        self.url = CloudConfig.getURL(PATH)
    }

    private func createRequest(_ data: String) -> HttpResponse {
        guard let httpsUrl = url.toURL() else { return HttpResponse(0, "", nil) }
        
        //Create request
        return networkService.executeRequest(
            httpsUrl: httpsUrl,
            method: .POST,
            data: data.toData(),
            timeout: TIMEOUT_SEND,
            headers: CloudConfig.headers,
            redirect: true
        )
    }
    
    func providersData() -> String {
        return converter.convert(from: providers)
    }
    
    func postBackData() -> String {
        let data = postBackModelFactory.create(events: [], logs: [], metrics: [], internalEvents: [])
        return postBackModelToJsonStringConverter.convert(from: [data])
    }
}

extension CheckStatusUseCaseImpl: CheckStatusUseCase {

    func send(_ onComplete: @escaping OnKeyValueCallback) {
        DispatchQueue.global(qos:.background).async { [weak self] in
            self?.sendWithRepeat(onComplete) {
                Thread.sleep(forTimeInterval: CheckStatusUseCaseImpl.TIME_DELAY_SENDING)
            }
        }
    }
    
    func sendWithRepeat( _ onComplete: @escaping OnKeyValueCallback, onFailedAttempt: () -> Void) {
        //attempts to send
        var attempts = ATTEMPTS_TO_SEND
        
        //Send or not
        var send = false

        //While has attempts and not send
        while (attempts != 0 && !send) {
            var postBackResponse: HttpResponse? = nil
            var response: HttpResponse? = nil
            
            if isPostBackSend == false {
                postBackResponse = createRequest(postBackData())
                if let postBackResponse = postBackResponse {
                    isPostBackSend = postBackResponse.isHttpValid()
                }
            }
            
            if isPostBackSend == true {
                response = createRequest(providersData())
            }
            
            if isPostBackSend && response?.isHttpValid() == true {
                onComplete(keyValueConverter.convert(from: response?.body ?? ""))
                
                //Send is ok
                send = true
            } else {
                attempts = attempts - 1
                //Check attempts
                if (attempts == 0) {
                    onComplete([])
                    
                    let httpResponse = response ?? postBackResponse
                    let error = AffiseError.network(status: httpResponse?.code ?? 0, message: httpResponse?.body)
                    //Log error
                    logsManager?.addSdkError(error: AffiseError.cloud(url: url, error: error, attempts: ATTEMPTS_TO_SEND, retry: true))
                } else {
                    onFailedAttempt()
                }
            }
        }
    }
}
