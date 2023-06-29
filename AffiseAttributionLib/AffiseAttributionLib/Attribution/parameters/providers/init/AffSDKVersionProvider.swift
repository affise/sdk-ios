//
//  AffSDKVersionProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 *  Provider for parameter [Parameters.AFFISE_SDK_VERSION]
 */
class AffSDKVersionProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return "1.1.7"
    }
}
