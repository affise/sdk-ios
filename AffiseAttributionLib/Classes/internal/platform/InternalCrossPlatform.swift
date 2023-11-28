import Foundation

public class InternalCrossPlatform {
    
    private static func getApi() -> AffiseApi? { return Affise.getApi() }

    public static func deeplink(_ uri: String) {
        getApi()?.deeplinkManager.handleDeeplink(url: URL(string: uri))
    }

    public static func start() {
        getApi()?.sessionManager.sessionStart()
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
