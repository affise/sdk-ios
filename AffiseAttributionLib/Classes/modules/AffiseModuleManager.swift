import Foundation
import UIKit 


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
        initAffiseModules { module in
            module.dependencies(
                app: app,
                logsManager: logsManager,
                dependencies: dependencies,
                providers: postBackModelFactory.getProviders()
            )
            
            if module.isManual() == false {
                moduleStart(module)
            }
        }
    }

    func getModules() -> [AffiseModules] {
        return Array(modules.keys)
    }

    func manualStart(_ module: AffiseModules) -> Bool {
        guard let affiseModule: AffiseModule = getModule(module) else { return false }
        if affiseModule.isManual() == false { return false }
        moduleStart(affiseModule)
        return true
    }

    func status(_ module: AffiseModules, _ onComplete: @escaping OnKeyValueCallback) {
        getModule(module)?.status(onComplete) ?? onComplete([AffiseKeyValue(module.className(), "not found")])
    }
    
    private func moduleStart(_ module: AffiseModule) {
        module.start()
        postBackModelFactory.addProviders(module.providers())
    }
    
    private func classType(_ name: AffiseModules) -> AffiseModule.Type? {
        let aClass: AnyClass? = NSClassFromString(name.className()) ?? NSClassFromString(name.classNameModule())
        guard let aClass = aClass else { return nil }  
        guard let cls = aClass as? AffiseModule.Type else { return nil }
        return cls
    }
    
    func getModule(_ name: AffiseModules) -> AffiseModule? {
        modules[name]
    }
    
    private func initAffiseModules(_ callback: (_ module: AffiseModule) -> Void) {
        for name in AffiseModules.values() {
            guard let cls = classType(name) else { continue }
        
            let module = cls.init()
            modules[name] = module

            callback(module)
        }
    }

    func api(_ module: AffiseModules) -> AffiseModuleApi? {
        return getModule(module) as? AffiseModuleApi
    }
}
