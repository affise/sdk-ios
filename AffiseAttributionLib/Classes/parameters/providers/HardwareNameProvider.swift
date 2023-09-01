//
//  HardwareNameProvider.swift
//  AffiseAttributionLib
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
    
    public override func getOrder() -> Float {
        23.0
    }

    public override func getKey() -> String? {
        Parameters.HARDWARE_NAME
    }
}
