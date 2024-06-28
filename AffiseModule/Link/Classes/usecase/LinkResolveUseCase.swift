import Foundation
import AffiseAttributionLib


protocol LinkResolveUseCase {
    func linkResolve(_ url: String, _ callback: @escaping AffiseLinkCallback)
}
