import Foundation


extension Affise {
    
    /**
     * Call deeplink handle manually
     */
    @objc
    public static func handleDeeplink(_ url: URL?) {
        Affise.getApi()?.deeplinkManager.handleDeeplink(url: url)
    }
    
    /**
     * Handle referrer manually
     */
    @objc
    public static func handleReferrer(_ url: URL?) {
        Affise.getApi()?.retrieveInstallReferrerUseCase.setReferrer(url)
    }
    
    /**
     * Handle user activity deeplink and referrer manually
     */
    @objc
    public static func handleUserActivity(_ userActivity: NSUserActivity) {
        if #available(iOS 11.0, *) {
            Affise.handleReferrer(userActivity.referrerURL)
        }
        
        // Get URL components from the incoming user activity.
        Affise.handleDeeplink(userActivity.webpageURL)
    }
}
