import Foundation
import UIKit

@objc
public class AffiseSettings: NSObject {

    private let affiseAppId: String?
    private let secretKey: String?
    private var isProduction: Bool = true
    private var partParamName: String?
    private var partParamNameToken: String?
    private var appToken: String?
    private var domain: String?
    
    @objc
    internal init(
        affiseAppId: String,
        secretKey: String
    ) {
        self.affiseAppId = affiseAppId
        self.secretKey = secretKey
    }
    
    /**
     * Set Affise SDK for SandBox / Production
     */
    @objc
    public func setProduction(_ production: Bool) -> AffiseSettings {
        self.isProduction = production
        return self
    }
    
    /**
     * Only for specific use case [partParamName]
     */
    @objc
    public func setPartParamName(_ partParamName: String) -> AffiseSettings {
        self.partParamName = partParamName
        return self
    }
    
    /**
     * Only for specific use case [partParamNameToken]
     */
    @objc
    public func setPartParamNameToken(_ partParamNameToken: String) -> AffiseSettings {
        self.partParamNameToken = partParamNameToken
        return self
    }
    
    /**
     * Set [appToken]
     */
    @objc
    public func setAppToken(_ appToken: String) -> AffiseSettings {
        self.appToken = appToken
        return self
    }
    
    /**
     * Set Affise SDK server [domain]
     * Triling slash is irrelivant
     */
    @objc
    public func setDomain(_ domain: String) -> AffiseSettings {
        self.domain = domain
        return self
    }
    
    private func getInitProperties() -> AffiseInitProperties {
        return AffiseInitProperties(
            affiseAppId: affiseAppId,
            partParamName: partParamName,
            partParamNameToken: partParamNameToken,
            appToken: appToken,
            isProduction: isProduction,
            secretKey: secretKey,
            domain: domain
        )
    }
    
    /**
     * Start Affise SDK using [app] and [launchOptions]
     */
    @objc
    public func start(
        app: UIApplication,
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) {
        Affise.start(initProperties: getInitProperties(), app: app, launchOptions: launchOptions)
    }
}
