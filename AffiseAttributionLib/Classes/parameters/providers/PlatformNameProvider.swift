/**
 *  Provider for parameter [ProviderType.PLATFORM]
 */
class PlatformNameProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return InternalSdkPlatform.IOS
    }
    
    public override func getOrder() -> Float {
        44.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.PLATFORM
    }
}
