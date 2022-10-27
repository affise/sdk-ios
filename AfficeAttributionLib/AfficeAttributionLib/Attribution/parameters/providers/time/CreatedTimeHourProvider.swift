//
//  CreatedTimeHourProvider.swift
//  AfficeAttributionLib
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
}
