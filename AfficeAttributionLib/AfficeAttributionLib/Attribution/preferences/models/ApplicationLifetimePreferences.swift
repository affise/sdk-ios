//
//  ApplicationLifetimePreferences.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Model describes preferences which persist until application reinstall
 *
 * @property trackingEnabled when disabled, library should not generate any tracking events
 */
struct ApplicationLifetimePreferences {
    let trackingEnabled: Bool
    
    init(trackingEnabled: Bool = true) {
        self.trackingEnabled = trackingEnabled
    }
    
    func copy(trackingEnabled: Bool? = nil) -> ApplicationLifetimePreferences {
        return ApplicationLifetimePreferences(trackingEnabled: trackingEnabled ?? self.trackingEnabled)
    }
}
