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
public class CreatedTimeProvider : LongPropertyProvider {
    override func provide() -> Int64? {
        return Date().timeIntervalSince1970.timeInMillis
    }
    
    public override func getOrder() -> Float {
        18.0
    }

    public override func getKey() -> String? {
        Parameters.CREATED_TIME
    }
}
