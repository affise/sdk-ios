import Foundation


class AffiseLink : NSObject, AffiseModuleApiWrapper {
    typealias API = AffiseLinkApi
    var api: API?
    var module: AffiseModules = .Link
}

extension AffiseLink : AffiseModuleLinkApi {
    
    func hasModule() -> Bool { hasModule }
    
    /**
     * Module Link url Resolve
     */
    func resolve(_ url: String, _ callback: @escaping AffiseLinkCallback) {
        moduleApi?.resolve(url, callback) ?? callback("")
    }
}
