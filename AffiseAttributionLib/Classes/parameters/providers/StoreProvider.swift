/**
 *  Provider for parameter [ProviderType.STORE]
 */
class StoreProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return "App Store"
    }
    
    public override func getOrder() -> Float {
        5.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.STORE
    }
}
