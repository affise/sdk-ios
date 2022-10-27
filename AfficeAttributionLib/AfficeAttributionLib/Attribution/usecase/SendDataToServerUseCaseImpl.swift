//
//  SendDataToServerUseCaseImpl.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation


internal class SendDataToServerUseCaseImpl {
    
    private static let TIME_DELAY_SENDING: TimeInterval = 15
    
    private let postBackModelFactory: PostBackModelFactory
    private let cloudRepository: CloudRepository
    private let eventsRepository: EventsRepository
//    private let sendServiceProvider: ExecutorServiceProvider
    private let logsRepository: LogsRepository
//    private let metricsRepository: MetricsRepository
    private let logsManager: LogsManager
    private let preferencesUseCase: PreferencesUseCase
    
    init(postBackModelFactory: PostBackModelFactory,
         cloudRepository: CloudRepository,
         eventsRepository: EventsRepository,
         logsRepository: LogsRepository,
         logsManager: LogsManager,
         preferencesUseCase: PreferencesUseCase) {
        
        self.postBackModelFactory = postBackModelFactory
        self.cloudRepository = cloudRepository
        self.eventsRepository = eventsRepository
        self.logsRepository = logsRepository
        self.logsManager = logsManager
        self.preferencesUseCase = preferencesUseCase
    }

    /**
     * Flags to status is sending from current url
     */
    private var isSend = Dictionary(uniqueKeysWithValues: CloudConfig.urls.map{ ($0, false) })

    
    /**
     * Sending for url
     */
    private func send(url: String) {
        
        var events: Array<SerializedEvent> = []
        var logs: Array<SerializedLog> = []
        var metrics: Array<SerializedEvent> = []
        
        repeat {
            //Get events
            events = eventsRepository.getEvents(url: url)
            
            //Get logs
            logs = logsRepository.getLogs(url: url)
            
            //Get metrics
//          metrics = metricsRepository.getMetrics(url)
            
            //Generate data
            let data = [postBackModelFactory.create(events: events, logs: logs, metrics: metrics)]
            
            do {
                //Send data for single url
                try cloudRepository.send(data: data, url: url)
                
                //Remove sent events
                eventsRepository.deleteEvent(ids: events.map { it in it.id }, url: url)
                
                //Remove sent logs
                logsRepository.deleteLogs(ids: logs.map { $0.id }, url: url)
                
                //Remove sent metrics
//              metricsRepository.deleteMetrics(url)
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
            logsManager.addSdkError(error: AfficeError.offlineModeEnabled)
            return
        }
        let globalQueue = DispatchQueue.global(qos:.background)
        //For all urls
        CloudConfig.urls.forEach { it in
            //Check if sending on this url
            if (isSend[it] == false) {
                //Lock sending to this url
                isSend[it] = true
                
                globalQueue.async { [weak self] in
                    if (withDelay) {
                        Thread.sleep(forTimeInterval: SendDataToServerUseCaseImpl.TIME_DELAY_SENDING)
                    }

                    self?.send(url: it)

                    //Unlock sending to this url
                    self?.isSend[it] = false
                }
            }
        }
    }
}
