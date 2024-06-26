import Foundation
import UIKit
import AffiseAttributionLib

@objc(AffiseLinkModule)
public final class LinkModule: AffiseModule {
    
    private var useCase: LinkResolveUseCase? = nil
        
    public override func start() {
        guard let networkService: NetworkService = get() else { return }

        useCase = LinkResolveUseCaseImpl(
            networkService: networkService
        )
    }
}

extension LinkModule : AffiseLinkApi {

    public func linkResolve(_ url: String, _ callback: @escaping AffiseLinkCallback) {
        useCase?.linkResolve(url, callback) ?? callback("")
    }
}
