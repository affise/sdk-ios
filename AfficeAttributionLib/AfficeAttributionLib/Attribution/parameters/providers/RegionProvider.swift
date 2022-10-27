//
//  RegionProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.REGION]
 */
class RegionProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return Locale.current.regionCode
    }
}
