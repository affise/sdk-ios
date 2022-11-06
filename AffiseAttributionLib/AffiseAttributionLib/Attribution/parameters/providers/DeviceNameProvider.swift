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
}
