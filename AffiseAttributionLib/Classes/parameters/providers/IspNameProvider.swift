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
    
    public override func getOrder() -> Float {
        37.0
    }

    public override func getKey() -> String? {
        Parameters.ISP
    }
}
