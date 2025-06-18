import Foundation

internal class AffiseAppsFlyer : NSObject, AffiseModuleApiWrapper {
    typealias API = AffiseAppsFlyerApi
    var api: API?
    var module: AffiseModules = .AppsFlyer
}

extension AffiseAppsFlyer : AffiseModuleAppsFlyerApi {
    
    func hasModule() -> Bool { hasModule }
    
    func logEvent(_ eventName: String, _ eventValues: [String : Any]) {
        moduleApi?.logEvent(eventName, eventValues)
    }
}
