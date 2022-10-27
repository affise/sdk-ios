//
//  PreferencesUseCaseImpl.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Implementation of [PreferencesUseCase]
 *
 * @property repository to store preferences that is persisted until app restart
 * @property lifetimeRepository to store preferences that is persisted until app reinstall
 */
internal class PreferencesUseCaseImpl : PreferencesUseCase {
    
    private var repository: ApplicationLifecyclePreferencesRepository
    private var lifetimeRepository: ApplicationLifetimePreferencesRepository
    
    init(repository: ApplicationLifecyclePreferencesRepository,
         lifetimeRepository: ApplicationLifetimePreferencesRepository) {
        
        self.repository = repository
        self.lifetimeRepository = lifetimeRepository
    }

    func setOfflineModeEnabled(enabled: Bool) {
        repository.preferences = repository.preferences.copy(offlineMode: enabled)
    }

    func isOfflineModeEnabled() -> Bool { return repository.preferences.offlineMode }

    func setBackgroundTrackingEnabled(enabled: Bool) {
        repository.preferences = repository.preferences.copy(backgroundTracking: enabled)
    }

    func isBackgroundTrackingEnabled() -> Bool { return repository.preferences.backgroundTracking }

    func setTrackingEnabled(enabled: Bool) {
        lifetimeRepository.preferences = lifetimeRepository.preferences.copy(trackingEnabled: enabled)
    }

    func isTrackingEnabled() -> Bool { return lifetimeRepository.preferences.trackingEnabled }
}
