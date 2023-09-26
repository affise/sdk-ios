
/**
 * Provider for parameter [ProviderType.TIME_SESSION]
 *
 * @property sessionManager to retrieve session time
 */
class TimeSessionProvider : LongPropertyProvider {
    
    private let sessionManager: SessionManager
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    override func provide() -> Int64? {
        return sessionManager.getSessionTime().timeInMillis
    }
    
    public override func getOrder() -> Float {
        55.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.TIME_SESSION
    }
}
