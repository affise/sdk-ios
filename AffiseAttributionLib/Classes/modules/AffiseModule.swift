open class AffiseModule {
    
    public let app: UIApplication
    public let logsManager: LogsManager
    public let dependencies: [Any]
    public let baseProviders: [Provider]

    public required init(
        app: UIApplication,
        logsManager: LogsManager,
        dependencies: [Any],
        providers: [Provider]
    ) {
        self.app = app
        self.logsManager = logsManager
        self.dependencies = dependencies
        self.baseProviders = providers
        self.initialize()
    }

    open func initialize() {}
    
    open func providers() -> [Provider] {
        return []
    }

    open func status(_ onComplete: @escaping (_ data: [AffiseKeyValue]) -> Void) {
        onComplete([AffiseKeyValue("state", "enabled")])
    }
    
    public func get<T>() -> T? {
        dependencies.first(where: { $0 is T }) as? T
    }
    
    public func getProvider<T: Provider>() -> T? {
        baseProviders.getProvider()
    }
}
