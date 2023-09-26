/**
 * Provider for parameter [ProviderType.CREATED_TIME_HOUR]
 */
class CreatedTimeHourProvider : LongPropertyProvider {
    override func provide() -> Int64? {
        return Date().timeIntervalSince1970.stripTimestampToHours.timeInMillis
    }
    
    public override func getOrder() -> Float {
        20.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.CREATED_TIME_HOUR
    }
}
