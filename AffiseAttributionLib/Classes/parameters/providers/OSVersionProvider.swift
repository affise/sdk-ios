//
//  OSVersionProvider.swift
//  AffiseAttributionLib
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
    
    public override func getOrder() -> Float {
        48.0
    }

    public override func getKey() -> String? {
        Parameters.OS_VERSION
    }
}
