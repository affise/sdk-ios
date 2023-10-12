internal class AffiseModuleManager {

    private let bundle: Bundle
    private let logsManager: LogsManager
    private let postBackModelFactory: PostBackModelFactory
    private var modules: [AffiseModules:AffiseModule] = [:]

    init(
        bundle: Bundle,
        logsManager: LogsManager,
        postBackModelFactory: PostBackModelFactory
    ) {
        self.bundle = bundle
        self.logsManager = logsManager
        self.postBackModelFactory = postBackModelFactory
    }

    func initialize(
        app: UIApplication,
        dependencies: [Any]
    ) {
        for name in AffiseModules.values() {
            guard let cls = classType(name) else { continue }
            
            let module = cls.init(
                app: app,
                logsManager: logsManager,
                dependencies: dependencies,
                providers: postBackModelFactory.getProviders()
            )
            
            postBackModelFactory.addProviders(module.providers())
            modules[name] = module
        }
    }

    func status(_ module: AffiseModules, _ onComplete: @escaping OnKeyValueCallback) {
        modules[module]?.status(onComplete)
    }
    
    private func classType(_ name: AffiseModules) -> AffiseModule.Type? {
        guard let cls = NSClassFromString(name.value()) as? AffiseModule.Type else { return nil }
        return cls
    }
}
