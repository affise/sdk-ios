import Foundation


class ImmediateSendToServerUseCaseImpl {

    private let cloudRepository: CloudRepository
    private let postBackModelFactory: PostBackModelFactory
    private let converterToSerializedEvent: EventToSerializedEventConverter
    private let logsManager: LogsManager

    private let globalQueue = DispatchQueue.global(qos:.background)

    init(
        cloudRepository: CloudRepository,
        postBackModelFactory: PostBackModelFactory,
        converterToSerializedEvent: EventToSerializedEventConverter,
        logsManager: LogsManager
    ) {
        self.cloudRepository = cloudRepository
        self.postBackModelFactory = postBackModelFactory
        self.converterToSerializedEvent = converterToSerializedEvent
        self.logsManager = logsManager
    }

    func sendNow(event: Event, url: String) -> HttpResponse {
        //Serialize event
        let serializedEvent = converterToSerializedEvent.convert(from: event)

        //Generate data
        let data = postBackModelFactory.create(events: [serializedEvent], logs: [], metrics: [], internalEvents: [])
        
        return cloudRepository.createRequest(url: url, data: [data])
    }
}

extension ImmediateSendToServerUseCaseImpl: ImmediateSendToServerUseCase {

    func sendNow(
        event: Event,
        success: @escaping OnSendSuccessCallback,
        failed: @escaping OnSendFailedCallback
    ) {
       //For all urls
        CloudConfig.urls.forEach { it in
            globalQueue.async { [weak self] in
                guard let self = self else { return }
                
                let response = self.sendNow(event: event, url: it)
                if response.isHttpValid() {
                    success()
                } else {
                    let _ = failed(response)
                }
            }
        }
    }
}
