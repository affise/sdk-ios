//
//  OSVersionProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import UIKit

/**
 * Provider for parameter [Parameters.OS_VERSION]
 */
class OSVersionProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return UIDevice.current.systemVersion
    }
}
