//
//  ApplicationLifecyclePreferences.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//


/**
 * Model describes preferences which persist until application restart
 *
 * @property offlineMode when enabled, no network activity should be triggered by library
 * @property backgroundTracking when disabled, library should not generate any tracking events while in background
 */
struct ApplicationLifecyclePreferences {
    let offlineMode: Bool
    let backgroundTracking: Bool
    
    
    init(offlineMode: Bool = false, backgroundTracking: Bool = true) {
        self.offlineMode = offlineMode
        self.backgroundTracking = backgroundTracking
    }
    
    func copy(offlineMode: Bool? = nil, backgroundTracking: Bool? = nil) -> ApplicationLifecyclePreferences {
        return ApplicationLifecyclePreferences(offlineMode: offlineMode ?? self.offlineMode, backgroundTracking: backgroundTracking ?? self.backgroundTracking)
    }
}
