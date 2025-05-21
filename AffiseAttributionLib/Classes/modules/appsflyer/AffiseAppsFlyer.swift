import Foundation

internal class AffiseAppsFlyer : NSObject, AffiseModuleApiWrapper {
    typealias API = AffiseAppsFlyerApi
    var api: API?
    var module: AffiseModules = .AppsFlyer
    var moduleManager: AffiseModuleManager?
    
    init(_ moduleManager: AffiseModuleManager?) {
        self.moduleManager = moduleManager
    }
}

extension AffiseAppsFlyer : AffiseAppsFlyerApi {
    
    func hasModule() -> Bool { api != nil }
    
    func logEvent(_ eventName: String, _ eventValues: [String : Any]) {
        moduleApi?.logEvent(eventName, eventValues)
    }
}
