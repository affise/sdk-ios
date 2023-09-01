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
    
    public override func getOrder() -> Float {
        24.0
    }

    public override func getKey() -> String? {
        Parameters.DEVICE_MANUFACTURER
    }
}
