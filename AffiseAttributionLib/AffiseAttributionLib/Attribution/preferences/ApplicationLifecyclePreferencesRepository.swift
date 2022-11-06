//
//  ApplicationLifecyclePreferencesRepository.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Repository to store [ApplicationLifecyclePreferences]
 */
internal protocol ApplicationLifecyclePreferencesRepository {

    /**
     * property to access to model stored by repository
     */
    var preferences: ApplicationLifecyclePreferences { get set }
}
