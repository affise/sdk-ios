//
//  MNCProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import CoreTelephony


/**
 * Provider for parameter [Parameters.MNCODE
 */
class MNCProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider

        // Get carrier name
        let carrierName = carrier?.mobileNetworkCode
        return carrierName
    }
}
