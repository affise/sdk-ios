import AffiseAttributionLib


class StatusModule: AffiseModule {
    
    private var checkStatusUseCase: CheckStatusUseCase? = nil
    
    private lazy var stringToKeyValueConverter: StringToKeyValueConverter = StringToKeyValueConverter()
    private lazy var providersToJsonStringConverter: ProvidersToJsonStringConverter = ProvidersToJsonStringConverter()
        
    override func initialize() {
        
        let createdTimeProvider: CreatedTimeProvider? = getProvider()
        let affiseAppIdProvider: AffiseAppIdProvider? = getProvider()
        let affisePackageAppNameProvider: AffisePackageAppNameProvider? = getProvider()
        let affAppTokenPropertyProvider: AffAppTokenPropertyProvider? = getProvider()
        let affiseDeviceIdProvider: AffiseDeviceIdProvider? = getProvider()
        let randomUserIdProvider: RandomUserIdProvider? = getProvider()
                
        let providers: [Provider?] = [
            createdTimeProvider,
            affiseAppIdProvider,
            affisePackageAppNameProvider,
            affAppTokenPropertyProvider,
            affiseDeviceIdProvider,
            randomUserIdProvider,
        ]
        
        checkStatusUseCase = CheckStatusUseCaseImpl(
            logsManager: logsManager,
            networkService: get(),
            providers: providers.compactMap { $0 },
            converter: providersToJsonStringConverter,
            keyValueConverter: stringToKeyValueConverter
        )
    }
    
    override func status(_ onComplete: @escaping ([AffiseKeyValue]) -> Void) {
        checkStatusUseCase?.send(onComplete)
    }
}

