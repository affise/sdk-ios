
/**
 * Provider for parameter [ProviderType.LAST_SESSION_TIME]
 *
 * @property sessionManager to retrieve last interaction time
 */
class LastSessionTimeProvider : LongPropertyProvider {
    
    private let sessionManager: SessionManager
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    override func provide() -> Int64? {
        if let time = sessionManager.getLastInteractionTime() {
            return time.timeInMillis
        } else {
            return nil
        }
    }
    
    public override func getOrder() -> Float {
        21.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.LAST_SESSION_TIME
    }
}
