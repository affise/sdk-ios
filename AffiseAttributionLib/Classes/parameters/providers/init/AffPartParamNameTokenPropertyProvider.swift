
/**
 * Provider for property [ProviderType.AFFISE_PART_PARAM_NAME_TOKEN]
 *
 * @property initProperties to retrieve part param name token
 */
class AffPartParamNameTokenPropertyProvider: StringPropertyProvider {
    private let storage: InitPropertiesStorage
    
    init(storage: InitPropertiesStorage) {
        self.storage = storage
    }
    
    override func provide() -> String? {
        return storage.getProperties()?.partParamNameToken
    }
    
    public override func getOrder() -> Float {
        60.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.AFFISE_PART_PARAM_NAME_TOKEN
    }
}
