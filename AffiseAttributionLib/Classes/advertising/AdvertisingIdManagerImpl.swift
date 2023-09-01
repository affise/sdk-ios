//
//  AdvertisingIdManagerImpl.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import AdSupport
import AppTrackingTransparency


class AdvertisingIdManagerImpl : AdvertisingIdManager {
    private let asIdentifierManager: ASIdentifierManager = ASIdentifierManager.shared()
    
    var advertisingId: String?
    
    func initialize() {
        
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { [weak self] status in
                guard let self = self else {
                    return
                }
                if status == .authorized {
                    let adId = self.asIdentifierManager.advertisingIdentifier
                    self.advertisingId = adId.uuidString
                }
            }
        } else if asIdentifierManager.isAdvertisingTrackingEnabled {
            let adId = self.asIdentifierManager.advertisingIdentifier
            self.advertisingId = adId.uuidString
        }
    }
    
    func getAdvertisingId() -> String? {
        return advertisingId
    }
}
