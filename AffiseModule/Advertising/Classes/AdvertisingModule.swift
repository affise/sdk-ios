import AffiseAttributionLib
import Foundation

@objc(AffiseAdvertisingModule)
public final class AdvertisingModule: AffiseModule {

    public override var version: String { BuildConfig.AFFISE_VERSION }

    private lazy var advertisingIdManager: AdvertisingIdManager = AdvertisingIdManagerImpl()
    
    private lazy var adidProvider: Provider = AdidProvider(advertisingIdManager: advertisingIdManager)

    private var newProviders: [Provider] = []

    override public func isManual() -> Bool {
        true
    }

    override public func start() {
        advertisingIdManager.initialize()
        
        newProviders = [
            adidProvider
        ]
    }

    override public func providers() -> [Provider] {
        newProviders
    }
}
