//
//  CountryProvider.swift
//  AfficeAttributionLib
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
}
