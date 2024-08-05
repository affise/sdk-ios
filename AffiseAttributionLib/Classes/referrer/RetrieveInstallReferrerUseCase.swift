import Foundation

class RetrieveInstallReferrerUseCase {

    private let moduleManager: AffiseModuleManager
    private var referrerModule: ReferrerCallback?
    private var referrerURL: URL?

    init(
        moduleManager: AffiseModuleManager
    ) {
        self.moduleManager = moduleManager
    }

    private func getReffererModule() -> ReferrerCallback? {
        if self.referrerModule != nil {
            return self.referrerModule
        }
        guard let module = moduleManager.getModule(.Status) else { return nil }
        guard let referrerModule = module as? ReferrerCallback else { return nil }
        self.referrerModule = referrerModule
        return referrerModule
    }

    private func getQueryStringParameter(_ url: String?, _ param: String) -> String? {
        guard let url = url else {
            return nil
        }
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
    }
    
    private func handleReferrer(_ callback: @escaping OnReferrerCallback) {
        guard let referrer = referrerURL else {
            getReffererModule()?.getReferrer(callback) ?? callback(nil)
            return
        }
        callback(referrer.absoluteString)
    }
    
    /**
     * Set referrerURL
     */
    func setReferrer(_ url: URL?) {
        referrerURL = url
    }
    
    /**
     * Return referrerURL
     */
    func getReferrer(_ callback: @escaping OnReferrerCallback) {
        handleReferrer { value in
            callback(value)
        }
    }
    
    /**
     * Return referrerURL parameter by key
     */
    func getReferrerValue(_ key: ReferrerKey, _ callback: @escaping OnReferrerCallback) {
        handleReferrer { value in
            callback(self.getQueryStringParameter(value, key.value()))
        }
    }
} 
