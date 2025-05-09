import CoreTelephony


/**
 * Provider for parameter [ProviderType.ISP]
 */
class IspNameProvider: StringPropertyProvider {
    
    private let useCase: NetworkInfoUseCase
    
    init(useCase: NetworkInfoUseCase) {
        self.useCase = useCase
    }

    override func provide() -> String? {
        let carrier = useCase.firstCarrier()

        // Get carrier name
        let carrierName = carrier?.carrierName
        return carrierName
    }
    
    public override func getOrder() -> Float {
        37.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.ISP
    }
}
