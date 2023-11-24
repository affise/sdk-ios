import UIKit

@objc
open class AffiseModule: NSObject {
    
    public var app: UIApplication?
    public var logsManager: LogsManager?
    public var dependencies: [Any] = []
    public var baseProviders: [Provider] = []

    public required init(
        app: UIApplication,
        logsManager: LogsManager,
        dependencies: [Any],
        providers: [Provider]
    ) {
        super.init()
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

    open func status(_ onComplete: @escaping OnKeyValueCallback) {
        onComplete([AffiseKeyValue("state", "enabled")])
    }
    
    public func get<T>() -> T? {
        dependencies.first(where: { $0 is T }) as? T
    }
    
    public func getProvider<T: Provider>() -> T? {
        baseProviders.getProvider()
    }
    
    public func getProviders(_ types: [Provider.Type]) -> [Provider] {
        return baseProviders.getProviders(types)
    }
    
    public func getRequestProviders() -> [Provider] {
        return baseProviders.getRequestProviders()
    }
}
