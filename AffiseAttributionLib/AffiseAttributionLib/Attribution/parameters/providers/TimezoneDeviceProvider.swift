//
//  TimezoneDeviceProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.TIMEZONE_DEV]
 */
class TimezoneDeviceProvider : StringPropertyProvider {
    /**
     * Returns timezone formatted in UTC template, for ex: UTC+0200
     */
    override func provide() -> String? {
        let formatter = DateFormatter()
        formatter.calendar = Calendar.current
        formatter.dateFormat = "XXXXX"
        return "UTC\(formatter.string(from: Date()))"
    }
}
