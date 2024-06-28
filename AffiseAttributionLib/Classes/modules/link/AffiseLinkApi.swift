import Foundation

public protocol AffiseLinkApi: AffiseModuleApi {
    func linkResolve(_ url: String, _ callback: @escaping AffiseLinkCallback)
}
