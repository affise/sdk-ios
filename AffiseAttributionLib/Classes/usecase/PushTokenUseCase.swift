import Foundation

protocol PushTokenUseCase {
    func addPushToken(pushToken: String, service: PushTokenService)
    func getPushToken() -> String?
    func getPushTokenService() -> String?
}