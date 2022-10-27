//
//  PushTokenProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.PUSHTOKEN]
 *
 * @property preferences to retrieve reftoken
 */
class PushTokenProvider: StringPropertyProvider {
    
    public static let KEY = "com.affise.attribution.init.PUSHTOKEN"
    
    private let preferences: UserDefaults
    
    init(preferences: UserDefaults) {
        self.preferences = preferences
    }
    
    override func provide() -> String? {
        return preferences.value(forKey: PushTokenProvider.KEY) as? String
    }
}
