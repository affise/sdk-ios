class DebugNetworkUseCaseImpl {
    let initProperties: AffiseInitProperties
    let networkService: NetworkService

    init(
        initProperties: AffiseInitProperties,
        networkService: NetworkService
    ) {
        self.initProperties = initProperties
        self.networkService = networkService
    }
}

extension DebugNetworkUseCaseImpl : DebugNetworkUseCase {

    func onRequest(_ onDebug: @escaping DebugOnNetworkCallback) {
        if initProperties.isProduction == true {
            return
        }
        networkService.setDebug(onDebug)
    }
}
