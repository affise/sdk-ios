//
//  IspNameProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import CoreTelephony


/**
 * Provider for parameter [Parameters.ISP
 */
class IspNameProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider

        // Get carrier name
        let carrierName = carrier?.carrierName
        return carrierName
    }
}
