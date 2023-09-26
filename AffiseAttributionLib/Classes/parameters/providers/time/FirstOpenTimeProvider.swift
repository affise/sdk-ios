
/**
 * Provider for parameter [ProviderType.FIRST_OPEN_TIME]
 *
 * @property useCase to retrieve first open time from
 */
class FirstOpenTimeProvider: LongPropertyProvider {
    private let useCase: FirstAppOpenUseCase

    init(useCase: FirstAppOpenUseCase) {
        self.useCase = useCase
    }

    override func provide() -> Int64? {
        guard let time = useCase.getFirstOpenDate() else {
            return nil
        }
        return time.timeInMillis
    }
    
    public override func getOrder() -> Float {
        7.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.FIRST_OPEN_TIME
    }
}
