
/**
 * Provider for parameter [ProviderType.AFFISE_SDK_SECRET_ID]
 *
 * @property initProperties to retrieve id from
 */
class AffSDKSecretIdProvider: StringPropertyProvider {
    private let storage: InitPropertiesStorage
    
    init(storage: InitPropertiesStorage) {
        self.storage = storage
    }
    
    override func provide() -> String? {
        return storage.getProperties()?.secretKey
    }
    
    public override func getOrder() -> Float {
        63.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.AFFISE_SDK_SECRET_ID
    }
}
