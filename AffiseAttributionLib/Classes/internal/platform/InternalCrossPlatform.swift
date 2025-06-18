import Foundation

public class InternalCrossPlatform {
    
    private static var api: AffiseApi? {
        get {
            Affise.api
        }
    }

    public static func deeplink(_ uri: String) {
        api?.deeplinkManager.handleDeeplink(url: URL(string: uri))
    }

    public static func start() {
        api?.sessionManager.sessionStart()
    }

    public static func react() {
        InternalSdkPlatform.react()
    }

    public static func flutter() {
        InternalSdkPlatform.flutter()
    }

    public static func unity() {
        InternalSdkPlatform.unity()
    }
}
