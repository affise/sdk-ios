import Foundation

internal class PushTokenUseCaseImpl {
    
    private let KEY_APP_PUSHTOKEN = "com.affise.attribution.init.PUSHTOKEN"
    private let KEY_APP_PUSHTOKEN_SERVICE = "com.affise.attribution.init.PUSHTOKEN_SERVICE"

    private let preferences: UserDefaults

    init(preferences: UserDefaults) {
        self.preferences = preferences
    }
}

extension PushTokenUseCaseImpl : PushTokenUseCase {

    func addPushToken(pushToken: String, service: PushTokenService) {
        preferences.set(pushToken, forKey: KEY_APP_PUSHTOKEN)
        preferences.set(service.service, forKey: KEY_APP_PUSHTOKEN_SERVICE)
    }

    func getPushToken() -> String? {
        return preferences.value(forKey: KEY_APP_PUSHTOKEN) as? String
    }

    func getPushTokenService() -> String? {
        return preferences.value(forKey: KEY_APP_PUSHTOKEN_SERVICE) as? String
    }
}