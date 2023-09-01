//
//  CountryProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.COUNTRY]
 */
class CountryProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return Locale.current.regionCode
    }
    
    public override func getOrder() -> Float {
        39.0
    }

    public override func getKey() -> String? {
        Parameters.COUNTRY
    }
}