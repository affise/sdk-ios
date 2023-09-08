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
public final class Affise: NSObject {

    @available(*, deprecated, message: "remove .shared")
    @objc
    public static let shared = AffiseShared()

    /**
     * Api to communication with Affise
     */
    private static var api: AffiseApi?
    
    /**
     * Init [AffiseComponent] with [app] and [initProperties]
     */
    @objc
    public static func load(
        app: UIApplication,
        initProperties: AffiseInitProperties,
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) {
        if (api == nil) {
            api = AffiseComponent(app: app, initProperties: initProperties, launchOptions: launchOptions)
        }
    }

    @objc
    public static func isInitialized() -> Bool {
        return api?.isInitialized() ?? false
    }
    
    /**
     * Send events
     */
    @objc
    public static func sendEvents() {
        api?.eventsManager.sendEvents()
    }
    
    /**
     * Store and send [event]
     */
    @objc
    public static func sendEvent(_ event: Event) {
        api?.storeEventUseCase.storeEvent(event: event)
    }
    
    /**
     * Add [pushToken]
     */
    @objc
    public static func addPushToken(_ pushToken: String) {
        api?.preferences.set(pushToken, forKey: PushTokenProvider.KEY)
    }
    
    /**
     * Register [webView] to WebBridge
     */
    @objc
    public static func registerWebView(_ webView: WKWebView) {
        api?.webBridgeManager.registerWebView(webView: webView)
    }
    
    /**
     * Unregister webView on WebBridge
     */
    @objc
    public static func unregisterWebView() {
        api?.webBridgeManager.unregisterWebView()
    }
    
    
    /**
     * Register [callback] for deeplink
     */
    @objc
    public static func registerDeeplinkCallback(_ callback: @escaping (_ url: URL) -> Void) {
        api?.deeplinkManager.setDeeplinkCallback(callback: callback)
    }
    
    /**
     * Set new secretKey
     */
    @objc
    public static func setSecretKey(_ secretKey: String) {
        api?.initPropertiesStorage.updateSecretKey(secretKey: secretKey)
    }
    
    /**
     * Sets offline mode to [enabled] state
     *
     * When enabled, no network activity should be triggered by this library,
     * but background work is not paused. When offline mode is enabled,
     * all recorded events should be sent
     */
    @objc
    public static func setOfflineModeEnabled(_ enabled: Bool) {
        api?.preferencesUseCase.setOfflineModeEnabled(enabled: enabled)
    }
    
    /**
     * Returns current offline mode state
     */
    @objc
    public static func isOfflineModeEnabled() -> Bool { 
        return api?.preferencesUseCase.isOfflineModeEnabled() ?? false 
    }
    
    /**
     * Sets background tracking mode to [enabled] state
     *
     * When disabled, library should not generate any tracking events while in background
     */
    @objc
    public static func setBackgroundTrackingEnabled(_ enabled: Bool) {
        api?.preferencesUseCase.setBackgroundTrackingEnabled(enabled: enabled)
    }
    
    /**
     * Returns current background tracking state
     */
    @objc
    public static func isBackgroundTrackingEnabled() -> Bool { 
        return api?.preferencesUseCase.isBackgroundTrackingEnabled() ?? false
    }
    
    /**
     * Sets offline mode to [enabled] state
     *
     * When disabled, library should not generate any tracking events
     */
    @objc
    public static func setTrackingEnabled(_ enabled: Bool) {
        api?.preferencesUseCase.setTrackingEnabled(enabled: enabled)
    }
    
    /**
     * Returns current tracking state
     */
    @objc
    public static func isTrackingEnabled() -> Bool {
        return api?.preferencesUseCase.isTrackingEnabled() ?? false 
    }

    /**
     * Returns random User Id
     */
    @objc
    public static func getRandomUserId() -> String? {
        let provider: RandomUserIdProvider? = api?.postBackModelFactory.getProvider()
        return provider?.provide()
    }

    /**
     * Returns random Device Id
     */
    @objc
    public static func getRandomDeviceId() -> String? {
        let provider: AffiseDeviceIdProvider? = api?.postBackModelFactory.getProvider()
        return provider?.provide()
    }

    /**
     * Get module status
     */
    @objc
    public static func getStatus(_ module: AffiseModules, _ onComplete: @escaping (_ data: [AffiseKeyValue]) -> Void) {
        api?.moduleManager.status(module, onComplete)
    }
    
    /**
     * Call deeplink handle manually
     */
    @objc
    public static func handleDeeplink(_ url: URL) {
        api?.deeplinkManager.handleDeeplink(url: url)
    }

    internal static func getApi() -> AffiseApi? {
        return api
    }
}
