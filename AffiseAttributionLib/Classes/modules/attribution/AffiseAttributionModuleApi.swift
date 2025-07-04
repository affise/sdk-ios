import Foundation

@objc
public protocol AffiseAttributionModuleApi : AnyObject {
    /**
     * Get module status
     */
    func getStatus(_ module: AffiseModules, _ onComplete: @escaping OnKeyValueCallback)
    
    /**
    * Manual module start
    */
    @discardableResult
    func moduleStart(_ module: AffiseModules) -> Bool

    /**
     * Get installed modules
     */
    func getModulesInstalledObjc() -> [String]
}
