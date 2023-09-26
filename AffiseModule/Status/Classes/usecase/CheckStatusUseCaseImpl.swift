import AffiseAttributionLib

internal class CheckStatusUseCaseImpl {
    
    private static let TIME_DELAY_SENDING: TimeInterval = 5
    private let ATTEMPTS_TO_SEND = 30
    private let TIMEOUT_SEND: TimeInterval = 30
    
    let URL = "https://tracking.affattr.com/check_status"

    let logsManager: LogsManager
    let converter: ProvidersToJsonStringConverter
    let keyValueConverter: StringToKeyValueConverter
    let networkService: NetworkService?
    let providers: [Provider]

    init(
        logsManager: LogsManager,
        networkService: NetworkService?,
        providers: [Provider],
        converter: ProvidersToJsonStringConverter,
        keyValueConverter: StringToKeyValueConverter
    ) {
        self.logsManager = logsManager
        self.converter = converter
        self.keyValueConverter = keyValueConverter
        self.networkService = networkService
        self.providers = providers
    }

    private func createRequest(url: String, data: [Provider]) throws -> String? {
        guard let networkService = networkService else {
            return nil
        }
        
        let httpsUrl = Foundation.URL(string: url)!
        
        let jsonString = converter.convert(from: data)
        let sendData = jsonString.data(using: .utf8)!
        
        //Create request
        let (data, response) = try networkService.executeRequest(
            httpsUrl: httpsUrl,
            method: .POST,
            data: sendData,
            timeout: TIMEOUT_SEND,
            headers: createHeaders()
        )
        
        var result: String?
        if let data = data {
            result = String.init(data: data, encoding: .utf8)
        }
        
        if (response.statusCode != 200) {
            throw AffiseError.network(status: response.statusCode, message: result)
        }
        return result
    }

    private func createHeaders() -> Dictionary<String, String> {
        return [
            "Content-Type" : "application/json; charset=utf-8"
        ]
    }
}

extension CheckStatusUseCaseImpl: CheckStatusUseCase {

    func send(_ onComplete: @escaping (_ data: [AffiseKeyValue]) -> Void) {
        DispatchQueue.global(qos:.background).async { [weak self] in
            self?.sendWithRepeat(onComplete) {
                Thread.sleep(forTimeInterval: CheckStatusUseCaseImpl.TIME_DELAY_SENDING)
            }
        }
    }
    
    func sendWithRepeat( _ onComplete: @escaping (_ data: [AffiseKeyValue]) -> Void, onFailedAttempt: () -> Void) {
        //attempts to send
        var attempts = ATTEMPTS_TO_SEND
        
        //Send or not
        var send = false

        //While has attempts and not send
        while (attempts != 0 && !send) {
            do {
                let response = try createRequest(url: URL, data: providers)
                onComplete(keyValueConverter.convert(from: response))
                
                //Send is ok
                send = true
            } catch {
                attempts = attempts - 1
                //Check attempts
                if (attempts == 0) {
                    onComplete([])
                    //Log error
                    logsManager.addSdkError(error: AffiseError.cloud(url: URL, error: error, attempts: ATTEMPTS_TO_SEND, retry: true))
                } else {
                    onFailedAttempt()
                }
            }
        }
    }
}
