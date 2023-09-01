//
//  Affise.swift
//  app
//
//  Created by Sergey Korney
//


/**
 * Entry point to initialise Affise Attribution library
 */
import Foundation
import UIKit
import WebKit


@objc
public class Affise: NSObject {
    
    @objc
    public static let shared = Affise()

    
    /**
     * Api to communication with Affise
     */
    private var api: AffiseApi?
    
    /**
     * Init [AffiseComponent] with [app] and [initProperties]
     */
    @objc
    public func load(app: UIApplication,
                     initProperties: AffiseInitProperties,
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        
        if (self.api == nil) {
            self.api = AffiseComponent(app: app, initProperties: initProperties, launchOptions: launchOptions)
        }
    }

    @objc
    public func isInitialized() -> Bool {
        return self.api?.isInitialized() ?? false
    }
    
    /**
     * Send events
     */
    @objc
    public func sendEvents() {
        api?.eventsManager.sendEvents()
    }
    
    /**
     * Store and send [event]
     */
    @objc
    public func sendEvent(event: Event) {
        api?.storeEventUseCase.storeEvent(event: event)
    }
    
    /**
     * Add [pushToken]
     */
    public func addPushToken(pushToken: String) {
        api?.preferences.set(pushToken, forKey: PushTokenProvider.KEY)
    }
    
    /**
     * Register [webView] to WebBridge
     */
    public func registerWebView(webView: WKWebView) {
        api?.webBridgeManager.registerWebView(webView: webView)
    }
    
    /**
     * Unregister webView on WebBridge
     */
    public func unregisterWebView() {
        api?.webBridgeManager.unregisterWebView()
    }
    
    
    /**
     * Register [callback] for deeplink
     */
    public func registerDeeplinkCallback(callback: @escaping (_ url: URL) -> Void) {
        api?.deeplinkManager.setDeeplinkCallback(callback: callback)
    }
    
    /**
     * Set new secretKey
     */
    public func setSecretId(secretKey: String) {
        api?.initPropertiesStorage.updateSecretKey(secretKey: secretKey)
    }
    
    /**
     * Sets offline mode to [enabled] state
     *
     * When enabled, no network activity should be triggered by this library,
     * but background work is not paused. When offline mode is enabled,
     * all recorded events should be sent
     */
    public func setOfflineModeEnabled(enabled: Bool) {
        api?.preferencesUseCase.setOfflineModeEnabled(enabled: enabled)
    }
    
    /**
     * Returns current offline mode state
     */
    public func isOfflineModeEnabled() -> Bool { return api?.preferencesUseCase.isOfflineModeEnabled() ?? false }
    
    /**
     * Sets background tracking mode to [enabled] state
     *
     * When disabled, library should not generate any tracking events while in background
     */
    public func setBackgroundTrackingEnabled(enabled: Bool) {
        api?.preferencesUseCase.setBackgroundTrackingEnabled(enabled: enabled)
    }
    
    /**
     * Returns current background tracking state
     */
    public func isBackgroundTrackingEnabled() -> Bool { return api?.preferencesUseCase.isBackgroundTrackingEnabled() ?? false }
    
    /**
     * Sets offline mode to [enabled] state
     *
     * When disabled, library should not generate any tracking events
     */
    public func setTrackingEnabled(enabled: Bool) {
        api?.preferencesUseCase.setTrackingEnabled(enabled: enabled)
    }
    
    /**
     * Returns current tracking state
     */
    public func isTrackingEnabled() -> Bool { return api?.preferencesUseCase.isTrackingEnabled() ?? false }

    /**
     * Returns random User Id
     */
    public func getRandomUserId() -> String? {
        let provider : RandomUserIdProvider? = api?.postBackModelFactory.getProvider()
        return provider?.provide()
    }

    /**
     * Returns random Device Id
     */
    public func getRandomDeviceId() -> String? {
        let provider : AffiseDeviceIdProvider? = api?.postBackModelFactory.getProvider()
        return provider?.provide()
    }

    /**
     * Get module status
     */
    public func getStatus(_ module: AffiseModules, onComplete: @escaping (_ data: [AffiseKeyValue]) -> Void) {
        api?.moduleManager.status(module, onComplete)
    }
    
    /**
     * Call deeplink handle manually
     */
    public func handleDeeplink(url: URL) {
        api?.deeplinkManager.handleDeeplink(url: url)
    }

    internal func getApi() -> AffiseApi? {
        return api
    }
}