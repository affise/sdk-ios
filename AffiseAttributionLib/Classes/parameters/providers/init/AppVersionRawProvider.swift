import Foundation

/**
 * App version number (Android) [ProviderType.APP_VERSION_RAW]
 */
class AppVersionRawProvider: StringPropertyProvider {
    private let bundle: Bundle
    
    init(bundle: Bundle) {
        self.bundle = bundle
    }
    
    override func provide() -> String? {
        return bundle.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    public override func getOrder() -> Float {
        4.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.APP_VERSION_RAW
    }
}
