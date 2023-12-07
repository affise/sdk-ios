import AffiseAttributionLib
import Foundation

@objc(AffiseAdvertisingModule)
public final class AdvertisingModule: AffiseModule {

    private lazy var advertisingIdManager: AdvertisingIdManager = AdvertisingIdManagerImpl()
    
    private lazy var adidProvider: Provider = AdidProvider(advertisingIdManager: advertisingIdManager)

    private var newProviders: [Provider] = []

    override public func isManual() -> Bool {
        true
    }

    override public func initialize() {
        advertisingIdManager.initialize()
        
        newProviders = [
            adidProvider
        ]
    }

    override public func providers() -> [Provider] {
        newProviders
    }
}
