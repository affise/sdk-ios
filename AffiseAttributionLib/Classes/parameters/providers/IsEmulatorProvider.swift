/**
 * Provider for parameter [Parameters.IS_EMULATOR]
 */
class IsEmulatorProvider: BooleanPropertyProvider {
    
    private let useCase: DeviceUseCase
    
    init(useCase: DeviceUseCase) {
        self.useCase = useCase
    }

    override func provide() -> Bool? {
        return useCase.isEmulator()
    }
    
    public override func getOrder() -> Float {
        67.0
    }

    public override func getKey() -> String? {
        Parameters.IS_EMULATOR
    }
}
