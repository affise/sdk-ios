import Foundation
import UIKit
import WebKit



@available(*, deprecated, message: "will be removed")
@objc
public class AffiseShared: NSObject {
    
    @available(*, deprecated, message: "use Affise.load(app:initProperties:launchOptions:)")
    @objc
    public func load(
        app: UIApplication,
        initProperties: AffiseInitProperties,
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) {
        
        Affise.load(app: app, initProperties: initProperties, launchOptions:launchOptions)
    }

    @available(*, deprecated, message: "use Affise.isInitialized()")
    @objc
    public func isInitialized() -> Bool {
        return Affise.isInitialized()
    }
    
    /**
     * Send events
     */

    @available(*, deprecated, message: "use Affise.sendEvents()")
    @objc
    public func sendEvents() {
        Affise.sendEvents()
    }
    
    /**
     * Store and send [event]
     */

    @available(*, deprecated, message: "use Affise.sendEvent(_ event:)")
    @objc
    public func sendEvent(event: Event) {
        Affise.sendEvent(event)
    }
    
    /**
     * Add [pushToken]
     */
    @available(*, deprecated, message: "use Affise.addPushToken(_ pushToken:)")
    @objc
    public func addPushToken(pushToken: String) {
        Affise.addPushToken(pushToken)
    }
    
    /**
     * Register [webView] to WebBridge
     */
    @available(*, deprecated, message: "use Affise.registerWebView(_ webView:)")
    public func registerWebView(webView: WKWebView) {
        Affise.registerWebView(webView)
    }
    
    /**
     * Unregister webView on WebBridge
     */
    @available(*, deprecated, message: "use Affise.unregisterWebView()")
    @objc
    public func unregisterWebView() {
        Affise.unregisterWebView()
    }
    
    
    /**
     * Register [callback] for deeplink
     */
    @available(*, deprecated, message: "use Affise.registerDeeplinkCallback(_ callback:)")
    public func registerDeeplinkCallback(callback: @escaping (_ url: URL) -> Void) {
        Affise.registerDeeplinkCallback(callback)
    }
    
    /**
     * Set new secretKey
     */

    @available(*, deprecated, message: "use Affise.setSecretKey(_ secretKey:)")
    public func setSecretId(secretKey: String) {
        Affise.setSecretKey(secretKey)
    }
    
    /**
     * Sets offline mode to [enabled] state
     *
     * When enabled, no network activity should be triggered by this library,
     * but background work is not paused. When offline mode is enabled,
     * all recorded events should be sent
     */
    @available(*, deprecated, message: "use Affise.setOfflineModeEnabled(_ :enabled)")
    @objc
    public func setOfflineModeEnabled(enabled: Bool) {
        Affise.setOfflineModeEnabled(enabled)
    }
    
    /**
     * Returns current offline mode state
     */
    @available(*, deprecated, message: "use Affise.isOfflineModeEnabled()")
    @objc
    public func isOfflineModeEnabled() -> Bool {
        return Affise.isOfflineModeEnabled()
    }
    
    /**
     * Sets background tracking mode to [enabled] state
     *
     * When disabled, library should not generate any tracking events while in background
     */
    @available(*, deprecated, message: "use Affise.setBackgroundTrackingEnabled(_ enabled:)")
    @objc
    public func setBackgroundTrackingEnabled(enabled: Bool) {
        Affise.setBackgroundTrackingEnabled(enabled)
    }
    
    /**
     * Returns current background tracking state
     */
    @available(*, deprecated, message: "use Affise.isBackgroundTrackingEnabled()")
    @objc
    public func isBackgroundTrackingEnabled() -> Bool {
        return Affise.isBackgroundTrackingEnabled()
    }
    
    /**
     * Sets offline mode to [enabled] state
     *
     * When disabled, library should not generate any tracking events
     */
    @available(*, deprecated, message: "use Affise.setTrackingEnabled(_ enabled:)")
    @objc
    public func setTrackingEnabled(enabled: Bool) {
        Affise.setTrackingEnabled(enabled)
    }
    
    /**
     * Returns current tracking state
     */
    @available(*, deprecated, message: "use Affise.isTrackingEnabled()")
    public func isTrackingEnabled() -> Bool {
        return Affise.isTrackingEnabled()
    }

    /**
     * Returns random User Id
     */
    @available(*, deprecated, message: "use Affise.getRandomUserId()")
    @objc
    public func getRandomUserId() -> String? {
        return Affise.getRandomUserId()
    }

    /**
     * Returns random Device Id
     */
    @available(*, deprecated, message: "use Affise.getRandomDeviceId()")
    @objc
    public func getRandomDeviceId() -> String? {
        return Affise.getRandomDeviceId()
    }

    /**
     * Get module status
     */
    @available(*, deprecated, message: "use Affise.getStatus(_ module: _ onComplete:)")
    public func getStatus(_ module: AffiseModules, onComplete: @escaping (_ data: [AffiseKeyValue]) -> Void) {
        Affise.getStatus(module, onComplete)
    }
    
    /**
     * Call deeplink handle manually
     */
    @available(*, deprecated, message: "use Affise.handleDeeplink(_ url:)")
    @objc
    public func handleDeeplink(url: URL) {
        Affise.handleDeeplink(url)
    }
}
