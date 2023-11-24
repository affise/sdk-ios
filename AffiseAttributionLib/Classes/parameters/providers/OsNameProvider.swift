import UIKit

/**
 * Provider for parameter [ProviderType.OS_NAME]
 */
class OsNameProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return UIDevice.current.systemName
    }
    
    public override func getOrder() -> Float {
        43.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.OS_NAME
    }
}
