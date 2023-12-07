import Foundation

/**
 * Provider for parameter [ProviderType.AFFISE_APP_ID]
 *
 * @property storage to retrieve affise app id
 */
public class AffiseAppIdProvider: StringPropertyProvider { 
    private let storage: InitPropertiesStorage
    
    init(storage: InitPropertiesStorage) {
        self.storage = storage
    }
    
    public override func provide() -> String? {
        return storage.getProperties()?.affiseAppId
    }
    
    public override func getOrder() -> Float {
        1.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.AFFISE_APP_ID
    }
}
