//
//  StoreProvider.swift
//  AffiseAttributionLib
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
    
    override func getOrder() -> Float {
        5.0
    }

    override func getKey() -> String? {
        Parameters.STORE
    }
}
