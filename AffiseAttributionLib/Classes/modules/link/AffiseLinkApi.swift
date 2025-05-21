import Foundation


@objc
public protocol AffiseLinkApi: AffiseModuleApi {
    func resolve(_ url: String, _ callback: @escaping AffiseLinkCallback)
}
