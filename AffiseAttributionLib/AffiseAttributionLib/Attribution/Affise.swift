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
     * Set new secretId
     */
    public func setSecretId(secretId: String) {
        api?.initPropertiesStorage.updateSecretId(secretId: secretId)
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
        return api?.postBackModelFactory.randomUserIdProvider.provide()
    }

    /**
     * Returns random Device Id
     */
    public func getRandomDeviceId() -> String? { 
        return api?.postBackModelFactory.affDeviceIdProvider.provide()
    }

    /**
     * Call deeplink handle manually
     */
    public func handleDeeplink(url: URL) {
        Affise.shared.api?.deeplinkManager.handleDeeplink(url: url)
    }

    public class _crossPlatform {
        /**
         * Handle Deeplink [uri] for cross platform
         */
        static public func handleDeeplink(uri: String) {
            if let url = URL(string: uri){
                Affise.shared.handleDeeplink(url: url)
            }
        }

        static public func start() {
            Affise.shared.api?.sessionManager.sessionStart()
        }

        static public func react() {
            SdkPlatform.react()
        }

        static public func flutter() {
            SdkPlatform.flutter()
        }

        static public func unity() {
            SdkPlatform.unity()
        }
    }
}
