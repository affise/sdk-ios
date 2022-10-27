//
//  DeviceManufacturerProvider.swift
//  AfficeAttributionLib
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
}
