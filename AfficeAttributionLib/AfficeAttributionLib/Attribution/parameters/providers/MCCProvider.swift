//
//  MCCProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import CoreTelephony


/**
 * Provider for parameter [Parameters.MCCODE
 */
class MCCProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider

        // Get carrier name
        let carrierName = carrier?.mobileCountryCode
        return carrierName
    }
}
