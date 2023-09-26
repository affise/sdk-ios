//
//  ApplicationLifetimePreferencesRepository.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//


/**
 * Repository for [ApplicationLifetimePreferences] model
 */
internal protocol ApplicationLifetimePreferencesRepository {

    /**
     * property to access to model stored by repository
     */
    var preferences: ApplicationLifetimePreferences { get set }
}
