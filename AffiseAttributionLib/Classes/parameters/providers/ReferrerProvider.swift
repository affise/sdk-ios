import Foundation

/**
 * Provider for parameter [ProviderType.REFERRER]
 */
class ReferrerProvider: StringPropertyProvider {
    
    private let useCase: RetrieveReferrerUseCase
    
    init(_ useCase: RetrieveReferrerUseCase) {
        self.useCase = useCase
    }
    
    override func provide() -> String? {
        return useCase.getReferrer()
    }
    
    public override func getOrder() -> Float {
        34.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.REFERRER
    }
}
