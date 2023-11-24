import Foundation
import AffiseAttributionLib

internal class CheckStatusUseCaseImpl {
    
    private static let TIME_DELAY_SENDING: TimeInterval = 5
    private let ATTEMPTS_TO_SEND = 30
    private let TIMEOUT_SEND: TimeInterval = 30
    
    let PATH: String = "check_status"
    var url: String = ""

    let logsManager: LogsManager?
    let converter: ProvidersToJsonStringConverter
    let keyValueConverter: StringToKeyValueConverter
    let networkService: NetworkService
    let providers: [Provider]

    init(
        affiseModule: AffiseModule,
        logsManager: LogsManager?,
        networkService: NetworkService,
        converter: ProvidersToJsonStringConverter,
        keyValueConverter: StringToKeyValueConverter
    ) {
        self.logsManager = logsManager
        self.converter = converter
        self.keyValueConverter = keyValueConverter
        self.networkService = networkService
        self.providers = affiseModule.getRequestProviders()
        
        self.url = CloudConfig.getURL(PATH)
    }

    private func createRequest() -> HttpResponse {
        guard let httpsUrl = url.toURL() else { return HttpResponse(0, "", nil) }
        
        //Create request
        return networkService.executeRequest(
            httpsUrl: httpsUrl,
            method: .POST,
            data: converter.convert(from: providers).toData(),
            timeout: TIMEOUT_SEND,
            headers: CloudConfig.headers
        )
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
            let response = createRequest()
            if isHttpValid(response.code) {
                onComplete(keyValueConverter.convert(from: response.body))
                
                //Send is ok
                send = true
            } else {
                attempts = attempts - 1
                //Check attempts
                if (attempts == 0) {
                    onComplete([])
                    let error = AffiseError.network(status: response.code, message: response.body)
                    //Log error
                    logsManager?.addSdkError(error: AffiseError.cloud(url: url, error: error, attempts: ATTEMPTS_TO_SEND, retry: true))
                } else {
                    onFailedAttempt()
                }
            }
        }
    }
}
