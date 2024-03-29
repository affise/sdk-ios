import Foundation

class StoreEventUseCaseImpl {
    private let repository: EventsRepository
    private let eventsManager: EventsManager
    private let preferencesUseCase: PreferencesUseCase
    private let appLifecycleEventsManager: AppLifecycleEventsManager
    private let logsManager: LogsManager
    private let isFirstForUserUseCase: IsFirstForUserUseCase
    
    init(repository: EventsRepository,
         eventsManager: EventsManager,
         preferencesUseCase: PreferencesUseCase,
         appLifecycleEventsManager: AppLifecycleEventsManager,
         logsManager: LogsManager,
         isFirstForUserUseCase: IsFirstForUserUseCase) {
        
        self.repository = repository
        self.eventsManager = eventsManager
        self.preferencesUseCase = preferencesUseCase
        self.appLifecycleEventsManager = appLifecycleEventsManager
        self.logsManager = logsManager
        self.isFirstForUserUseCase = isFirstForUserUseCase
    }
    
    
    private func isTrackingEnabled() -> Bool {
        if (!preferencesUseCase.isTrackingEnabled()) {
            logsManager.addSdkError(error: AffiseError.trackingDisabledException)
            return false
        }
        if (isAppInBackground()) {
            if (!preferencesUseCase.isBackgroundTrackingEnabled()) {
                logsManager.addSdkError(error: AffiseError.backgroundTrackingDisabledException)
                return false
            }
        }

        return true
    }

    private func isAppInBackground() -> Bool {
        return appLifecycleEventsManager.isBackground
    }
}

extension StoreEventUseCaseImpl: StoreEventUseCase {
    func storeEvent(event: Event) {
        
        if (isTrackingEnabled()) {
            DispatchQueue.global(qos:.background).sync { [weak self] in
                //Update event for isFirstForUser
                self?.isFirstForUserUseCase.updateEvent(event)
                
                //Save event
                self?.repository.storeEvent(event: event, urls: CloudConfig.urls)

                //Send events
                self?.eventsManager.sendEvents()
            }
        }
    }
    
    func storeWebEvent(event: String) {
        if (isTrackingEnabled() || event != GDPREvent.EVENT_NAME) {
            DispatchQueue.global(qos:.background).sync { [weak self] in  
                //Update event for isFirstForUser
                let updatedEvent = self?.isFirstForUserUseCase.updateWebEvent(event) ?? event

                //Save event
                self?.repository.storeWebEvent(event: updatedEvent, urls: CloudConfig.urls)

                //Send events
                self?.eventsManager.sendEvents()
            }
        }
    }
}
