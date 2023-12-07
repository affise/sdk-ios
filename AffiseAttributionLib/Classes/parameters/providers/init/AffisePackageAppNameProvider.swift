import Foundation

/**
 * Provider for parameter [ProviderType.AFFISE_PKG_APP_NAME]
 *
 */
public class AffisePackageAppNameProvider: StringPropertyProvider {
    private let bundle: Bundle
    
    init(bundle: Bundle) {
        self.bundle = bundle
    }
    
    public override func provide() -> String? {
        return bundle.bundleIdentifier
    }
    
    public override func getOrder() -> Float {
        2.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.AFFISE_PKG_APP_NAME
    }
}
