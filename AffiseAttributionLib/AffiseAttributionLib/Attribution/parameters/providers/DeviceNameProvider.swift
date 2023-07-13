//
//  DeviceNameProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import UIKit

/**
 * Provider for parameter [Parameters.DEVICE_NAME]
 */
class DeviceNameProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return UIDevice.current.name
    }
    
    override func getOrder() -> Float {
        41.0
    }

    override func getKey() -> String? {
        Parameters.DEVICE_NAME
    }
}
