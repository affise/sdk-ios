//
//  ProxyIpAddressProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.PROXY_IP_ADDRESS]
 */
class ProxyIpAddressProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return getProxyName()
    }
    
    private func getProxyName() -> String? {
        if let proxySettingsUnmanaged = CFNetworkCopySystemProxySettings() {
            let proxySettings = proxySettingsUnmanaged.takeRetainedValue()
            if let dict = proxySettings as? [String: AnyObject],
                let value = dict[kCFNetworkProxiesHTTPProxy as String] as? String {
                
                return value;
            }
        }
        return nil;
    }
    
    override func getOrder() -> Float {
        24.1
    }

    override func getKey() -> String? {
        Parameters.PROXY_IP_ADDRESS
    }
}
