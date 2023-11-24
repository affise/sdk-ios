import UIKit

/**
 * Provider for parameter [ProviderType.DEVICE_NAME]
 */
class DeviceNameProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return UIDevice.current.name
    }
    
    public override func getOrder() -> Float {
        41.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.DEVICE_NAME
    }
}
