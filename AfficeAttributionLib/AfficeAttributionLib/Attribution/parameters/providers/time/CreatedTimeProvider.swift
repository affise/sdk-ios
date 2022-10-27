//
//  CreatedTimeProvider.swift
//  AfficeAttributionLib
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
}
