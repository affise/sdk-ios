import Foundation


class AffiseLink : NSObject, AffiseModuleApiWrapper {
    typealias API = AffiseLinkApi
    var api: API?
    var module: AffiseModules = .Link
    var moduleManager: AffiseModuleManager?
    
    init(_ moduleManager: AffiseModuleManager?) {
        self.moduleManager = moduleManager
    }
}

extension AffiseLink : AffiseLinkApi {
    
    func hasModule() -> Bool { api != nil }
    
    /**
     * Module Link url Resolve
     */
    func resolve(_ url: String, _ callback: @escaping AffiseLinkCallback) {
        moduleApi?.resolve(url, callback) ?? callback("")
    }
}

extension Affise.Module {
    @available(*, deprecated, message: "Method moved to Affise.Module.Link", renamed: "Module.Link.resolve")
    @objc
    public static func linkResolve(_ url: String, _ callback: @escaping AffiseLinkCallback) {
        Affise.Module.Link.resolve(url, callback)
    }
}

extension AffiseLink {
    @available(*, deprecated, message: "Method moved to Affise.Module.Link", renamed: "Module.Link.resolve")
    public static func linkResolve(_ url: String, _ callback: @escaping AffiseLinkCallback) {
        Affise.Module.Link.resolve(url, callback)
    }
}
