//
//  WebBridgeManager.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import WebKit

internal class WebBridgeManager: NSObject, WKScriptMessageHandler {
    
    private let WEB_BRIDGE_JAVASCRIPT_INTERFACE_NAME = "AffiseBridge"
    
    private let storeEventUseCase: StoreEventUseCase
    
    init(storeEventUseCase: StoreEventUseCase) {
        self.storeEventUseCase = storeEventUseCase
    }

    /**
     * Configuration
     */
    private var webView: WKWebView?

    /**
     * Register [webView] to WebBridgeManager
     */
    func registerWebView(webView: WKWebView) {
        //Save webView
        self.webView = webView
        webView.configuration.userContentController.add(self, name: WEB_BRIDGE_JAVASCRIPT_INTERFACE_NAME)
        let bundle = Bundle(for: type(of: self))
        do {
            let contents = try String(contentsOfFile: "\(bundle.bundlePath)/affise.js")
            let script = WKUserScript(source: contents,
                                      injectionTime: .atDocumentStart,
                                      forMainFrameOnly: false)
            webView.configuration.userContentController.addUserScript(script)
        } catch {
            // contents could not be loaded
        }
    }

    /**
     * Unregister [webView] on WebBridgeManager
     */
    func unregisterWebView() {
        //Remove JavascriptInterface on webView
        webView?.configuration.userContentController.removeScriptMessageHandler(forName: WEB_BRIDGE_JAVASCRIPT_INTERFACE_NAME)

        //Remove webView
        webView = nil
    }

    /**
     * Send [event] from webView
     */
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        
        if message.name == WEB_BRIDGE_JAVASCRIPT_INTERFACE_NAME,
            let event = message.body as? String {
            
            //Store event
            storeEventUseCase.storeWebEvent(event: event)
        }
    }
}
