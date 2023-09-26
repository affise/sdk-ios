/**
 * Provider for parameter [ProviderType.INSTALLED_HOUR]
 *
 * @property useCase to retrieve first open time from
 */
class InstalledHourProvider : LongPropertyProvider {
    private let useCase: FirstAppOpenUseCase
    
    init(useCase: FirstAppOpenUseCase) {
        self.useCase = useCase
    }
    
    override func provide() -> Int64? {
        guard let time = useCase.getFirstOpenDate() else {
            return nil
        }
        return time.stripTimestampToHours.timeInMillis
    }
    
    public override func getOrder() -> Float {
        8.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.INSTALLED_HOUR
    }
}
