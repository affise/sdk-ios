//
//  HardwareNameProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import UIKit

/**
 * Provider for parameter [Parameters.HARDWARE_NAME]
 */
class HardwareNameProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return UIDevice.current.model
    }
}
