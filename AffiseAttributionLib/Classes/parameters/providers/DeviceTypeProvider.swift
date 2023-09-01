//
//  DeviceTypeProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import UIKit

/**
 * Provider for parameter [Parameters.DEVICE_TYPE]
 */
class DeviceTypeProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        switch UIDevice.current.userInterfaceIdiom {
            
        case .unspecified:
            return "smartphone"
        case .phone:
            return "smartphone"
        case .pad:
            return "tablet"
        case .tv:
            return "tv"
        case .carPlay:
            return "car"
        case .mac:
            return "mac"
        @unknown default:
            return "smartphone"
        }
    }
    
    public override func getOrder() -> Float {
        42.0
    }

    public override func getKey() -> String? {
        Parameters.DEVICE_TYPE
    }
}
