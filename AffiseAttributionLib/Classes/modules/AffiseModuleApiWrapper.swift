import Foundation

internal protocol AffiseModuleApiWrapper: AnyObject {
    associatedtype API
    var api: API? { get set }
    var module: AffiseModules { get }
    var moduleManager: AffiseModuleManager? { get }
}

extension AffiseModuleApiWrapper {
    
    internal var moduleApi: API? {
        get {
            if api == nil {
                api = moduleManager?.api(module) as? API
            }
            return api
        }
    }
}
