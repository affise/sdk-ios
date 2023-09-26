
/**
 * Provider for property [ProviderType.AFFISE_APP_TOKEN]
 *
 * @property initProperties to retrieve appToken
 */
public class AffAppTokenPropertyProvider: StringWithParamPropertyProvider {
    private let storage: InitPropertiesStorage
    private let stringToSHA256Converter: StringToSHA256Converter
    
    init(storage: InitPropertiesStorage, stringToSHA256Converter: StringToSHA256Converter) {
        self.storage = storage
        self.stringToSHA256Converter = stringToSHA256Converter
    }
    
    override func provideWithParam(_ param: String) -> String {
        return stringToSHA256Converter.convert(
            from: (storage.getProperties()?.affiseAppId ?? "") +
            param +
            (storage.getProperties()?.secretKey ?? "")
        )
    }   

    public override func getOrder() -> Float {
        61.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.AFFISE_APP_TOKEN
    }
}
