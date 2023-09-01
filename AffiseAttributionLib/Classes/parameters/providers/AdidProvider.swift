//
//  AdidProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.ADID]
 */
internal class AdidProvider : StringPropertyProvider {
    private let advertisingIdManager: AdvertisingIdManager
    
    init(advertisingIdManager: AdvertisingIdManager) {
        self.advertisingIdManager = advertisingIdManager
    }

    override func provide() -> String? {
        return advertisingIdManager.getAdvertisingId()
    }
    
    public override func getOrder() -> Float {
        29.0
    }

    public override func getKey() -> String? {
        Parameters.ADID
    }
}
