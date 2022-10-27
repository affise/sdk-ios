//
//  RefTokenProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.REFTOKEN]
 *
 * @property preferences to retrieve reftoken
 */
class RefTokenProvider: StringPropertyProvider {
    
    private let KEY = "com.affise.attribution.parameters.REFTOKEN"
    
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
