//
//  OsNameProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import UIKit

/**
 * Provider for parameter [Parameters.OS_NAME]
 */
class OsNameProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return UIDevice.current.systemName
    }
    
    override func getOrder() -> Float {
        43.0
    }

    override func getKey() -> String? {
        Parameters.OS_NAME
    }
}
