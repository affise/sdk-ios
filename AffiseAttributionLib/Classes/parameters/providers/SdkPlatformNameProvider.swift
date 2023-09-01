//
//  PlatformNameProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 *  Provider for parameter [Parameters.SDK_PLATFORM]
 */
class SdkPlatformNameProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return SdkPlatform.info
    }
    
    public override func getOrder() -> Float {
        45.0
    }

    public override func getKey() -> String? {
        Parameters.SDK_PLATFORM
    }
}
