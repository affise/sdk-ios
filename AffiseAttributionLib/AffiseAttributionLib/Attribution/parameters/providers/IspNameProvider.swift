//
//  IspNameProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import CoreTelephony


/**
 * Provider for parameter [Parameters.ISP]
 */
class IspNameProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider

        // Get carrier name
        let carrierName = carrier?.carrierName
        return carrierName
    }
    
    override func getOrder() -> Float {
        37.0
    }

    override func getKey() -> String? {
        Parameters.ISP
    }
}
