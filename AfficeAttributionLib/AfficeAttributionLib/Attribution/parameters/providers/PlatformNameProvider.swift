//
//  PlatformNameProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 *  Provider for parameter [Parameters.PLATFORM]
 */
class PlatformNameProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return "ios"
    }
}
