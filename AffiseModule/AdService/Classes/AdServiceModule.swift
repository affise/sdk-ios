import AffiseAttributionLib
import Foundation

@objc(AffiseAdServiceModule)
public final class AdServiceModule: AffiseModule {

    public override var version: String { BuildConfig.AFFISE_VERSION }

    private lazy var adServiceUseCase: AdServiceUseCase = AdServiceUseCaseImpl()
    
    private lazy var adServiceAttributionTokenProvider: Provider = AdServiceAttributionTokenProvider(adServiceUseCase: adServiceUseCase)

    private var newProviders: [Provider] = []

    override public func start() {
        adServiceUseCase.initialize()
        
        newProviders = [
            adServiceAttributionTokenProvider
        ]
    }

    override public func providers() -> [Provider] {
        newProviders
    }
}
