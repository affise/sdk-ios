//
//  DeeplinkClickRepository.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Storage for isDeeplink model to determine if app was opened by deeplink
 */
protocol DeeplinkClickRepository {
    /**
     * Sets flag [isDeeplink] describing if app was opened by deeplink
     */
    func setDeeplinkClick(isDeeplink: Bool)
    
    /**
     * Returns flag describing if app was opened by deeplink
     */
    func isDeeplinkClick() -> Bool
    
    /**
     * Store deeplink that has been used to open this app
     */
    func setDeeplink(deeplink: String)
    
    /**
     * returns deeplink that has been used to open this app or null
     */
    func getDeeplink() -> String?
}
