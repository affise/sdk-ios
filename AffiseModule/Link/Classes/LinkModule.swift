import Foundation
import UIKit
import AffiseAttributionLib

@objc(AffiseLinkModule)
public final class LinkModule: AffiseModule {
    
    public override var version: String { "1.6.36" }
    
    private var useCase: LinkResolveUseCase? = nil
        
    public override func start() {
        let networkService: NetworkService? = get()
        if networkService == nil
        {
            print(AffiseModuleError.initModule(name: .Link).localizedDescription)
            return
        }

        useCase = LinkResolveUseCaseImpl(
            networkService: networkService!
        )
    }
}

extension LinkModule : AffiseLinkApi {

    public func linkResolve(_ url: String, _ callback: @escaping AffiseLinkCallback) {
        useCase?.linkResolve(url, callback) ?? callback("")
    }
}
