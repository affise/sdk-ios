import UIKit

/**
 * Provider for parameter [ProviderType.OS_VERSION]
 */
class OSVersionProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return UIDevice.current.systemVersion
    }
    
    public override func getOrder() -> Float {
        48.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.OS_VERSION
    }
}
