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
}
