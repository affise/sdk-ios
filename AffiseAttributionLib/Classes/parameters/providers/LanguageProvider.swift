/**
 * Provider for parameter [ProviderType.LANGUAGE]
 */
class LanguageProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return Locale.current.identifier
    }
    
    public override func getOrder() -> Float {
        40.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.LANGUAGE
    }
}
