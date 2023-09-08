public class InternalCrossPlatform {
    
    private static func getApi() -> AffiseApi? { return Affise.getApi() }

    public static func deeplink(_ uri: String) {
        guard let url = URL(string: uri) else { return }

        getApi()?.deeplinkManager.handleDeeplink(url: url)
    }

    public static func start() {
        getApi()?.sessionManager.sessionStart()
    }

    public static func react() {
        SdkPlatform.react()
    }

    public static func flutter() {
        SdkPlatform.flutter()
    }

    public static func unity() {
        SdkPlatform.unity()
    }
}
