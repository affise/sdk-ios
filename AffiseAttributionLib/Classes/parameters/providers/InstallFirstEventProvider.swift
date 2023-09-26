
/**
 * Provider for parameter [ProviderType.INSTALL_FIRST_EVENT]
 *
 * @property useCase to retrieve is first open from
 */
class InstallFirstEventProvider : BooleanPropertyProvider {
    private let useCase: FirstAppOpenUseCase
    
    init(useCase: FirstAppOpenUseCase) {
        self.useCase = useCase
    }
    
    override func provide() -> Bool? {
        return useCase.isFirstOpen()
    }
    
    public override func getOrder() -> Float {
        10.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.INSTALL_FIRST_EVENT
    }
}
