import Foundation

class AffiseLink {
    private static var api: AffiseLinkApi? {
        get {
            if module != nil {
                return module
            } else {
                module = Affise.Module.getApi(.Link) as? AffiseLinkApi
            }
            return module
        }
    }
    
    private static var module: AffiseLinkApi? = nil

   /**
    * Module Link url Resolve
    */
    public static func linkResolve(_ url: String, _ callback: @escaping AffiseLinkCallback) {
        api?.linkResolve(url, callback) ?? callback("")
    }
}

extension Affise.Module {
    
    /**
     * Module Link url Resolve
     */
    public static func linkResolve(_ url: String, _ callback: @escaping AffiseLinkCallback) {
        AffiseLink.linkResolve(url, callback)
    }
}
