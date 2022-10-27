//
//  WebViewUseCase.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import WebKit


internal class WebViewUseCase {
    
    private let WEB_VIEW_USER_AGENT_KEY = "WEB_VIEW_USER_AGENT"
    
    private let preferences: UserDefaults
    
    init(preferences: UserDefaults) {
        self.preferences = preferences
    }
    
    func initialize() {
        let userAgent = WKWebView().value(forKey: "userAgent") as? String
        preferences.set(userAgent, forKey: WEB_VIEW_USER_AGENT_KEY)
    }
    
    
   func getUserAgent() -> String {
       return preferences.string(forKey: WEB_VIEW_USER_AGENT_KEY) ?? ""
   }
}
