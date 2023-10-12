//
//  AffiseInitProperties.swift
//
//  Created by Sergey Korney
//


@objc
public class AffiseInitProperties: NSObject {
    let affiseAppId: String?
    let partParamName: String?
    let partParamNameToken: String?
    let appToken: String?
    let isProduction: Bool
    let secretKey: String?
    let flags: [AffiseFlag]
    
    @objc
    public init(
        affiseAppId: String?,
        partParamName: String? = nil,
        partParamNameToken: String? = nil,
        appToken: String? = nil,
        isProduction: Bool = true,
        secretKey: String? = nil
    ) {
        self.affiseAppId = affiseAppId
        self.partParamName = partParamName
        self.partParamNameToken = partParamNameToken
        self.appToken = appToken
        self.isProduction = isProduction
        self.secretKey = secretKey
        self.flags = []
    }

    @objc
    public convenience init(
        affiseAppId: String,
        secretKey: String
    ) {
        self.init(
            affiseAppId: affiseAppId,
            partParamName: nil,
            partParamNameToken: nil,
            appToken: nil,
            isProduction: true,
            secretKey: secretKey
        )
    }

    @objc
    public convenience init(
        affiseAppId: String,
        secretKey: String,
        isProduction: Bool
    ) {
        self.init(
            affiseAppId: affiseAppId,
            partParamName: nil,
            partParamNameToken: nil,
            appToken: nil,
            isProduction: isProduction,
            secretKey: secretKey
        )
    }
}
