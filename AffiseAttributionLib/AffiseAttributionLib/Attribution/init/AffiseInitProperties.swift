//
//  AffiseInitProperties.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation


@objc
public class AffiseInitProperties: NSObject {
    let affiseAppId: String?
    let partParamName: String?
    let partParamNameToken: String?
    let appToken: String?
    let isProduction: Bool
    let secretId: String?
    
    @objc
    public init(affiseAppId: String?,
                partParamName: String? = nil,
                partParamNameToken: String? = nil,
                appToken: String? = nil,
                isProduction: Bool = true,
                secretId: String? = nil) {
        
        self.affiseAppId = affiseAppId
        self.partParamName = partParamName
        self.partParamNameToken = partParamNameToken
        self.appToken = appToken
        self.isProduction = isProduction
        self.secretId = secretId
    }
}
