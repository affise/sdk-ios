//
//  DeviceManufacturerProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 *  Provider for parameter [Parameters.DEVICE_MANUFACTURER]
 */
class DeviceManufacturerProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return "Apple"
    }
    
    override func getOrder() -> Float {
        24.0
    }

    override func getKey() -> String? {
        Parameters.DEVICE_MANUFACTURER
    }
}
