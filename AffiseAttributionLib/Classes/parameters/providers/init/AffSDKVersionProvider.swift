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
        return "1.6.10"
    }
    
    public override func getOrder() -> Float {
        47.0
    }

    public override func getKey() -> String? {
        Parameters.AFFISE_SDK_VERSION
    }
}
