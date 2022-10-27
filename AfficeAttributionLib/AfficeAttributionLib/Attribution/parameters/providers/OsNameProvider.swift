//
//  OsNameProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import UIKit

/**
 * Provider for parameter [Parameters.DEVICE_NAME]
 */
class OsNameProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return UIDevice.current.systemName
    }
}
