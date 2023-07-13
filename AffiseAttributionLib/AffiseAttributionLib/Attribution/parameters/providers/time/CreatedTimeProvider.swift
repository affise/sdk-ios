//
//  CreatedTimeProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.CREATED_TIME]
 */
class CreatedTimeProvider : LongPropertyProvider {
    override func provide() -> Int64? {
        return Date().timeIntervalSince1970.timeInMillis
    }
    
    override func getOrder() -> Float {
        18.0
    }

    override func getKey() -> String? {
        Parameters.CREATED_TIME
    }
}
