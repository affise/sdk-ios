//
//  NetworkTypeProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import CoreTelephony
import SystemConfiguration


/**
 * Provider for parameter [Parameters.NETWORK_TYPE]
 */
class NetworkTypeProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return geNetworkType()
    }
    
    private func geNetworkType() -> String? {
        guard let reachability = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, "www.google.com") else {
            return nil
        }
        
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability, &flags)
        
        let isReachable = flags.contains(.reachable)
        let isWWAN = flags.contains(.isWWAN)
        
        if isReachable {
            if isWWAN {
                let networkInfo = CTTelephonyNetworkInfo()
                var serviceCurrentRadioAccessTechnology: [String : String]?
                if #available(iOS 12.0, *) {
                    serviceCurrentRadioAccessTechnology = networkInfo.serviceCurrentRadioAccessTechnology
                }
                
                guard let carrierTypeName = serviceCurrentRadioAccessTechnology?.first?.value else {
                    return nil
                }
                
                
                if #available(iOS 14.1, *) {
                    if carrierTypeName == CTRadioAccessTechnologyNRNSA {
                        return "NRNSA"
                    }
                    if carrierTypeName == CTRadioAccessTechnologyNR {
                        return "NR"
                    }
                }
                
                switch carrierTypeName {
                case CTRadioAccessTechnologyGPRS:
                    return "GPRS"
                case CTRadioAccessTechnologyEdge:
                    return "EDGE"
                case CTRadioAccessTechnologyWCDMA:
                    return "WCDMA"
                case CTRadioAccessTechnologyHSDPA:
                    return "HSDPA"
                case CTRadioAccessTechnologyHSUPA:
                    return "HSUPA"
                case CTRadioAccessTechnologyCDMA1x:
                    return "CDMA"
                case CTRadioAccessTechnologyCDMAEVDORev0:
                    return "EVDO_0"
                case CTRadioAccessTechnologyCDMAEVDORevA:
                    return "EVDO_A"
                case CTRadioAccessTechnologyCDMAEVDORevB:
                    return "EVDO_B"
                case CTRadioAccessTechnologyeHRPD:
                    return "EHRPD"
                case CTRadioAccessTechnologyLTE:
                    return "LTE"
                    
                default:
                    return ""
                }
            } else {
                return "WIFI"
            }
        } else {
            return nil
        }
    }
    
    override func getOrder() -> Float {
        23.1
    }

    override func getKey() -> String? {
        Parameters.NETWORK_TYPE
    }
}
