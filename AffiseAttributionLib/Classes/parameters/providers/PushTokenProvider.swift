/**
 * Provider for parameter [ProviderType.PUSHTOKEN]
 *
 * @property preferences to retrieve reftoken
 */
class PushTokenProvider: StringPropertyProvider {
    
    public static let KEY = "com.affise.attribution.init.PUSHTOKEN"
    
    private let preferences: UserDefaults
    
    init(preferences: UserDefaults) {
        self.preferences = preferences
    }
    
    override func provide() -> String? {
        return preferences.value(forKey: PushTokenProvider.KEY) as? String
    }
    
    public override func getOrder() -> Float {
        65.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.PUSHTOKEN
    }
}
