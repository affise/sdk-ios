/**
 * Provider for parameter [ProviderType.CREATED_TIME_MILLI]
 */
class CreatedTimeMilliProvider : LongPropertyProvider {
    override func provide() -> Int64? {
        return Date().timeIntervalSince1970.stripTimestampToMilis.timeInMillis
    }
    
    public override func getOrder() -> Float {
        19.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.CREATED_TIME_MILLI
    }
}
