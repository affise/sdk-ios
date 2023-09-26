//
//  DeeplinkClickRepositoryImpl.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//


/**
 * Implementation of [DeeplinkClickRepository]
 */
class DeeplinkClickRepositoryImpl : DeeplinkClickRepository {
    private var _deeplinkClick: Bool = false
    private var _deeplink: String? = nil
    
    func setDeeplinkClick(isDeeplink: Bool) {
        _deeplinkClick = isDeeplink
    }
    
    func isDeeplinkClick() -> Bool {
        return _deeplinkClick
    }
    
    func setDeeplink(deeplink: String) {
        _deeplink = deeplink
    }
    
    func getDeeplink() -> String? {
        return _deeplink
    }
}
