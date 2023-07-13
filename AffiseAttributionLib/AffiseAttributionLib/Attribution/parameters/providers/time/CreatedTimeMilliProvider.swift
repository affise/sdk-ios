//
//  CreatedTimeMilliProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.CREATED_TIME_HOUR]
 */
class CreatedTimeMilliProvider : LongPropertyProvider {
    override func provide() -> Int64? {
        return Date().timeIntervalSince1970.stripTimestampToMilis.timeInMillis
    }
    
    override func getOrder() -> Float {
        19.0
    }

    override func getKey() -> String? {
        Parameters.CREATED_TIME_HOUR
    }
}
