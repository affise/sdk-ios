import Foundation

/**
 *  Provider for parameter [ProviderType.AFFISE_SDK_VERSION]
 */
class AffSDKVersionProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return BuildConfig.AFFISE_VERSION
    }
    
    public override func getOrder() -> Float {
        47.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.AFFISE_SDK_VERSION
    }
}
