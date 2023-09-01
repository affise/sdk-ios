//
//  UuidProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for parameter [Parameters.UUID]
 */
class UuidProvider: StringPropertyProvider {

    override func provide() -> String? {
        return generateUUID().uuidString.lowercased()
    }
    
    public override func getOrder() -> Float {
        64.0
    }

    public override func getKey() -> String? {
        Parameters.UUID
    }
}
