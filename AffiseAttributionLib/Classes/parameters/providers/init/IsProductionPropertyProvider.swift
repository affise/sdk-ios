
/**
 * Provider for property [ProviderType.AFFISE_SDK_POS]
 *
 * @property initProperties to retrieve is production
 */
class IsProductionPropertyProvider: StringPropertyProvider {    
    private static let TYPE_SANDBOX = "Sandbox"
    private static let TYPE_PRODUCTION = "Production"
    
    private let storage: InitPropertiesStorage
    
    init(storage: InitPropertiesStorage) {
        self.storage = storage
    }
    
    override func provide() -> String {
        if (storage.getProperties()?.isProduction ?? false) {
            return IsProductionPropertyProvider.TYPE_PRODUCTION
        } else {
            return IsProductionPropertyProvider.TYPE_SANDBOX
        }
    }
    
    public override func getOrder() -> Float {
        50.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.AFFISE_SDK_POS
    }
}
