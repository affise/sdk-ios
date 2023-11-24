import Foundation

/**
 * Provider for parameter [ProviderType.APP_VERSION]
 */
class AppVersionProvider: StringPropertyProvider {
    private let bundle: Bundle
    
    init(bundle: Bundle) {
        self.bundle = bundle
    }
    
    override func provide() -> String? {
        return bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    public override func getOrder() -> Float {
        3.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.APP_VERSION
    }
}
