import Foundation


@objc
public protocol AffiseModuleApi : AnyObject  {
    /**
     * Check if Module present
     */
    func hasModule() -> Bool
}
