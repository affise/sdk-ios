//
//  RegionProvider.swift
//  AffiseAttributionLib
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
    
    public override func getOrder() -> Float {
        38.0
    }

    public override func getKey() -> String? {
        Parameters.REGION
    }
}
