//
//  AffiseApi.swift
//
//  Created by Sergey Korney
//


internal protocol AffiseApi {
    var firstAppOpenUseCase: FirstAppOpenUseCase {get}
    var sessionManager: SessionManager {get}
    var eventsManager: EventsManager {get}
    var storeEventUseCase: StoreEventUseCase {get}
    var preferences: UserDefaults {get}
    var logsManager: LogsManager {get}
    var webBridgeManager: WebBridgeManager {get}
    var deeplinkManager: DeeplinkManager {get}
    var initPropertiesStorage: InitPropertiesStorage {get}
    var preferencesUseCase: PreferencesUseCase {get}
    var postBackModelFactory: PostBackModelFactory {get}
    var moduleManager: AffiseModuleManager {get}
    var storeInternalEventUseCase:StoreInternalEventUseCase {get}

    func isInitialized() -> Bool
}
