import Foundation

/**
 * Provider for parameter [ProviderType.PUSHTOKEN_SERVICE]
 *
 * @property useCase to retrieve reftoken service
 */
class PushTokenServiceProvider: StringPropertyProvider {
    
    private let useCase: PushTokenUseCase
    
    init(_ useCase: PushTokenUseCase) {
        self.useCase = useCase
    }
    
    override func provide() -> String? {
        return useCase.getPushTokenService()
    }
    
    public override func getOrder() -> Float {
        65.1
    }

    public override func getKey() -> ProviderType? {
        ProviderType.PUSHTOKEN_SERVICE
    }
}
