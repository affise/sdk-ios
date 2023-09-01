//
//  MCCProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import CoreTelephony


/**
 * Provider for parameter [Parameters.MCCODE]
 */
class MCCProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider

        // Get carrier name
        let carrierName = carrier?.mobileCountryCode
        return carrierName
    }
    
    public override func getOrder() -> Float {
        36.0
    }

    public override func getKey() -> String? {
        Parameters.MCCODE
    }
}
