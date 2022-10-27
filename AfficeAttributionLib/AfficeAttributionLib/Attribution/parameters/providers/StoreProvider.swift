//
//  StoreProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 *  Provider for parameter [Parameters.STORE]
 */
class StoreProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return "App Store"
    }
}
