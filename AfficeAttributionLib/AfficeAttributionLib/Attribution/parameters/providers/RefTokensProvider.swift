//
//  RefTokensProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.REFTOKENS]
 *
 * @property preferences to retrieve reftoken
 */
class RefTokensProvider: StringPropertyProvider {
    
    private let KEY = "com.affise.attribution.parameters.REFTOKENS"
    
    private let preferences: UserDefaults
    
    init(preferences: UserDefaults) {
        self.preferences = preferences
    }
    
    override func provide() -> String? {
        
        //Check token
        if let token = preferences.value(forKey: KEY) {
            return token as? String
        } else {
            let newToken = UUID().uuidString
            //Save token to preferences
            preferences.set(newToken, forKey: KEY)
            return newToken
        }
    }
}

