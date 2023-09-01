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
    
    public override func getOrder() -> Float {
        5.0
    }

    public override func getKey() -> String? {
        Parameters.STORE
    }
}
