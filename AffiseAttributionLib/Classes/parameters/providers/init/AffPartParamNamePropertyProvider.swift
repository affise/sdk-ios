
/**
 * Provider for property [ProviderType.AFFISE_PART_PARAM_NAME]
 *
 * @property initProperties to retrieve part param name
 */
class AffPartParamNamePropertyProvider: StringPropertyProvider {
    private let storage: InitPropertiesStorage
    
    init(storage: InitPropertiesStorage) {
        self.storage = storage
    }
    
    override func provide() -> String? {
        return storage.getProperties()?.partParamName
    }
    
    public override func getOrder() -> Float {
        59.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.AFFISE_PART_PARAM_NAME
    }
}
