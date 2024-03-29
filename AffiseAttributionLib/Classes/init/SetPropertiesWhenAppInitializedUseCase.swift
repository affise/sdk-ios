//
//  SetPropertiesWhenAppInitializedUseCase.swift
//  app
//
//  Created by Sergey Korney
//


/**
 * Use case to set properties on library init
 */
protocol SetPropertiesWhenAppInitializedUseCase {

    /**
     * Init SetPropertiesWhenAppInitializedUseCase with [initProperties]
     */
    func initialize(initProperties: AffiseInitProperties)
}
