/**
 * Provider for parameter [ProviderType.LIFETIME_SESSION_COUNT]
 *
 * @property sessionManager to retrieve lifetime session time
 */
class LifetimeSessionCountProvider : LongPropertyProvider {
    
    private let sessionManager: SessionManager
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    override func provide() -> Int64? {
        return sessionManager.getLifetimeSessionTime().timeInMillis
    }
    
    public override func getOrder() -> Float {
        57.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.LIFETIME_SESSION_COUNT
    }
}
