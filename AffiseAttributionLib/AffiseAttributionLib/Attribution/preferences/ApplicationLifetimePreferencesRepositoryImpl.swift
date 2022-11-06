//
//  ApplicationLifetimePreferencesRepositoryImpl.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Implementation of [ApplicationLifetimePreferencesRepository]
 *
 * @property sharedPreferences to store [ApplicationLifetimePreferences] model
 */
internal class ApplicationLifetimePreferencesRepositoryImpl : ApplicationLifetimePreferencesRepository {
    
    private static let PREFERENCE_TRACKING = "com.affise.attribution.preferences.PREFERENCE_TRACKING"
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    
    
    
    var preferences: ApplicationLifetimePreferences {
        get {
            let value = userDefaults.value(forKey: ApplicationLifetimePreferencesRepositoryImpl.PREFERENCE_TRACKING) as? Bool ?? true
            
            return ApplicationLifetimePreferences(trackingEnabled: value)
        }
        set {
            userDefaults.set(newValue.trackingEnabled, forKey: ApplicationLifetimePreferencesRepositoryImpl.PREFERENCE_TRACKING)
        }
        
    }
}
