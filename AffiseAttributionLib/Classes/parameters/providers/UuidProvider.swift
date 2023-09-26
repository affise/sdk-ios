/**
 * Provider for parameter [ProviderType.UUID]
 */
class UuidProvider: StringPropertyProvider {

    override func provide() -> String? {
        return generateUUID().uuidString.lowercased()
    }
    
    public override func getOrder() -> Float {
        64.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.UUID
    }
}
