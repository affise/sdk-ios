internal class SendDataToServerUseCaseImpl {
    
    private static let TIME_DELAY_SENDING: TimeInterval = 15
    
    private let postBackModelFactory: PostBackModelFactory
    private let cloudRepository: CloudRepository
    private let eventsRepository: EventsRepository
    private let internalEventsRepository: InternalEventsRepository
//    private let sendServiceProvider: ExecutorServiceProvider
    private let logsRepository: LogsRepository
//    private let metricsRepository: MetricsRepository
    private let logsManager: LogsManager
    private let preferencesUseCase: PreferencesUseCase
    
    init(postBackModelFactory: PostBackModelFactory,
         cloudRepository: CloudRepository,
         eventsRepository: EventsRepository,
         internalEventsRepository: InternalEventsRepository,
         logsRepository: LogsRepository,
         logsManager: LogsManager,
         preferencesUseCase: PreferencesUseCase) {
        
        self.postBackModelFactory = postBackModelFactory
        self.cloudRepository = cloudRepository
        self.eventsRepository = eventsRepository
        self.internalEventsRepository = internalEventsRepository
        self.logsRepository = logsRepository
        self.logsManager = logsManager
        self.preferencesUseCase = preferencesUseCase
    }

    /**
     * Flags to status is sending from current url
     */
    private var isSendThreadUnsafe: [String:Bool] = Dictionary(uniqueKeysWithValues: CloudConfig.urls.map{ ($0, false) })
    private let lockQueue = DispatchQueue(label: "com.affise.attribution", attributes: .concurrent)

    func getIsSend(_ key: String) -> Bool {
        lockQueue.sync {
            guard let result = isSendThreadUnsafe[key] else { return false }
            return result
        }
    }

    func setIsSend(_ key: String, _ value: Bool) {
        lockQueue.async(flags: .barrier) {
            self.isSendThreadUnsafe[key] = value
        }
    }
    
    /**
     * Sending for url
     */
    private func send(url: String) {
        
        var events: Array<SerializedEvent> = []
        var logs: Array<SerializedLog> = []
        let metrics: Array<SerializedEvent> = []
        var internalEvents: Array<SerializedEvent> = []
        
        repeat {
            //Get events
            events = eventsRepository.getEvents(url: url)
            
            //Get logs
            logs = logsRepository.getLogs(url: url)
            
            //Get metrics
//          metrics = metricsRepository.getMetrics(url)
            
            //Get internal events
            internalEvents = internalEventsRepository.getEvents(url: url)

            //Generate data
            let data = [postBackModelFactory.create(events: events, logs: logs, metrics: metrics, internalEvents: internalEvents)]
            
            do {
                //Send data for single url
                try cloudRepository.send(data: data, url: url)
                
                //Remove sent events
                eventsRepository.deleteEvent(ids: events.map { it in it.id }, url: url)
                
                //Remove sent logs
                logsRepository.deleteLogs(ids: logs.map { $0.id }, url: url)
                
                //Remove sent metrics
//              metricsRepository.deleteMetrics(url)

                //Remove sent internal events
                internalEventsRepository.deleteEvent(ids: internalEvents.map { it in it.id }, url: url)
            } catch {
                //Log error
                logsManager.addNetworkError(error: error)
                
                return
            }
        } while (events.count == EventsParams.EVENTS_SEND_COUNT)
    }
}

extension SendDataToServerUseCaseImpl: SendDataToServerUseCase {
    /**
     * Send data
     */
    func send(withDelay: Bool) {
        if (preferencesUseCase.isOfflineModeEnabled()) {
            logsManager.addSdkError(error: AffiseError.offlineModeEnabled)
            return
        }
        let globalQueue = DispatchQueue.global(qos:.background)
        
        //For all urls
        CloudConfig.urls.forEach { it in
            //Check if sending on this url
            if (getIsSend(it) == false) {
                //Lock sending to this url
                setIsSend(it, true)
                
                globalQueue.async { [weak self] in
                    if (withDelay) {
                        Thread.sleep(forTimeInterval: SendDataToServerUseCaseImpl.TIME_DELAY_SENDING)
                    }

                    self?.send(url: it)

                    //Unlock sending to this url
                    self?.setIsSend(it, false)
                }
            }
        }
    }
}
