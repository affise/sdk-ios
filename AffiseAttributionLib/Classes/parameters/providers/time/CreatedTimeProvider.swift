import Foundation

/**
 * Provider for parameter [ProviderType.CREATED_TIME]
 */
public class CreatedTimeProvider : LongPropertyProvider {
    public override func provide() -> Int64? {
        return Date().timeIntervalSince1970.timeInMillis
    }
    
    public override func getOrder() -> Float {
        18.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.CREATED_TIME
    }
}
