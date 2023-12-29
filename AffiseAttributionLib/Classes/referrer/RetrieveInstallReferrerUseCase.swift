import Foundation

class RetrieveInstallReferrerUseCase {

    let moduleManager: AffiseModuleManager
    var referrerModule: ReferrerCallback?

    init(
        moduleManager: AffiseModuleManager
    ) {
        self.moduleManager = moduleManager
    }

    func getReffererModule() -> ReferrerCallback? {
        if self.referrerModule != nil {
            return self.referrerModule
        }
        guard let module = moduleManager.getModule(.Status) else { return nil }
        guard let referrerModule = module as? ReferrerCallback else { return nil }
        self.referrerModule = referrerModule
        return referrerModule
    }

    func getQueryStringParameter(_ url: String, _ param: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
    }    
    
    func getReferrer(_ callback: @escaping OnReferrerCallback) {
        getReffererModule()?.getReferrer(callback) ?? callback(nil)
    }
    
    func getReferrerValue(_ key: ReferrerKey, _ callback: @escaping OnReferrerCallback) {
        guard let module = getReffererModule() else {
            callback(nil)
            return
        }
        module.getReferrer { value in
            callback(self.getQueryStringParameter("https://referrer/?\(value ?? "")", key.value()))
        }
    }
} 
