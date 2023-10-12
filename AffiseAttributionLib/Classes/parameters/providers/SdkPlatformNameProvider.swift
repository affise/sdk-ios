/**
 *  Provider for parameter [ProviderType.SDK_PLATFORM]
 */
class SdkPlatformNameProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return InternalSdkPlatform.info
    }
    
    public override func getOrder() -> Float {
        45.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.SDK_PLATFORM
    }
}
