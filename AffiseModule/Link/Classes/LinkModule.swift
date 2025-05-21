import Foundation
import UIKit
import AffiseAttributionLib

@objc(AffiseLinkModule)
public final class LinkModule: AffiseModule, AffiseLinkApi {
    
    public override var version: String { "1.6.50" }
    
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
    
    public func hasModule() -> Bool { true }
    
    public func resolve(_ url: String, _ callback: @escaping AffiseLinkCallback) {
        useCase?.linkResolve(url, callback) ?? callback("")
    }
}
