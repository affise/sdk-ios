import Foundation


@objc
public protocol AffiseAppsFlyerApi: AffiseModuleApi {
    func logEvent(_ eventName: String, _ eventValues: [String: Any])
}
