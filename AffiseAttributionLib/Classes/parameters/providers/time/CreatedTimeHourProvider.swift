//
//  CreatedTimeHourProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.CREATED_TIME_HOUR]
 */
class CreatedTimeHourProvider : LongPropertyProvider {
    override func provide() -> Int64? {
        return Date().timeIntervalSince1970.stripTimestampToHours.timeInMillis
    }
    
    public override func getOrder() -> Float {
        20.0
    }

    public override func getKey() -> String? {
        Parameters.CREATED_TIME_HOUR
    }
}
