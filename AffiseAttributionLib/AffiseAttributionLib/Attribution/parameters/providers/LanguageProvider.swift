//
//  LanguageProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.LANGUAGE]
 */
class LanguageProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return Locale.current.identifier
    }
    
    override func getOrder() -> Float {
        40.0
    }

    override func getKey() -> String? {
        Parameters.LANGUAGE
    }
}
