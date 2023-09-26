import AffiseAttributionLib

@objc
public class AffiseApiWrapper: NSObject {
    private let UUID: String = "callback_uuid"

    private let factory = AffiseEventFactory()
    private let affiseBuilder = AffiseBuilder()

    private var callback: ((_ api: String, _ data: [String: Any?]) -> Void)? = nil

    private var app: UIApplication? = nil
    private var launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil

    @objc(app:launchOptions:)
    public init(_ app: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        self.app = app
        self.launchOptions = launchOptions
    }

    @objc(callback:)
    public func setCallback(_ callback: @escaping (_ api: String, _ data: String) -> Void) {
        self.callback = { apiName, map in
            callback(apiName, map.toArray().jsonString())
        }
    }

    public func setCallback(_ callback: @escaping (_ api: String, _ map: [String: Any?]) -> Void) {
        self.callback = { apiName, map in
            callback(apiName, map)
        }
    }

    @objc(deeplink:)
    public func handleDeeplink(_ link: String?) {
        guard let url = link else { return }
        InternalCrossPlatform.deeplink(url)
    }
    
    @objc(react)
    public func react() {
        InternalCrossPlatform.react()
    }
    
    @objc(flutter)
    public func flutter() {
        InternalCrossPlatform.flutter()
    }
    
    @objc(unity)
    public func unity() {
        InternalCrossPlatform.unity()
    }

    @objc(call:map:result:)
    public func call(_ name: String, map: [String: AnyObject], result: AffiseResult?) {
        guard let api = AffiseApiMethod.from(name) else {
            return
        }
        call(api, map: map, result: result)
    }
    
    public func call(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        switch api {
        case .INIT: callInit(api, map: map, result: result)
        case .IS_INITIALIZED: callIsInitialized(api, map: map, result: result)
        case .SEND_EVENTS: callSendEvents(api, map: map, result: result)
        case .SEND_EVENT: callSendEvent(api, map: map, result: result)
        case .ADD_PUSH_TOKEN: callAddPushToken(api, map: map, result: result)
        case .REGISTER_WEB_VIEW: callRegisterWebView(api, map: map, result: result)
        case .UNREGISTER_WEB_VIEW: callUnregisterWebView(api, map: map, result: result)
        case .SET_SECRET_ID: callSetSecretId(api, map: map, result: result)
        case .SET_AUTO_CATCHING_TYPES: callSetAutoCatchingTypes(api, map: map, result: result)
        case .SET_OFFLINE_MODE_ENABLED: callSetOfflineModeEnabled(api, map: map, result: result)
        case .IS_OFFLINE_MODE_ENABLED: callIsOfflineModeEnabled(api, map: map, result: result)
        case .SET_BACKGROUND_TRACKING_ENABLED: callSetBackgroundTrackingEnabled(api, map: map, result: result)
        case .IS_BACKGROUND_TRACKING_ENABLED: callIsBackgroundTrackingEnabled(api, map: map, result: result)
        case .SET_TRACKING_ENABLED: callSetTrackingEnabled(api, map: map, result: result)
        case .IS_TRACKING_ENABLED: callIsTrackingEnabled(api, map: map, result: result)
        case .FORGET: callForget(api, map: map, result: result)
        case .SET_ENABLED_METRICS: callSetEnabledMetrics(api, map: map, result: result)
        case .CRASH_APPLICATION: callCrashApplication(api, map: map, result: result)
        case .GET_RANDOM_USER_ID: callGetRandomUserId(api, map: map, result: result)
        case .GET_RANDOM_DEVICE_ID: callGetRandomDeviceId(api, map: map, result: result)
        case .GET_PROVIDERS: callGetProviders(api, map: map, result: result)
        case .GET_REFERRER_CALLBACK: callGetReferrer(api, map: map, result: result)
        case .GET_REFERRER_VALUE_CALLBACK: callGetReferrerValue(api, map: map, result: result)
        case .GET_STATUS_CALLBACK: callGetStatusCallback(api, map: map, result: result)
        case .REGISTER_DEEPLINK_CALLBACK: callRegisterDeeplinkCallback(api, map: map, result: result)
        case .SKAD_REGISTER_ERROR_CALLBACK: callSkadRegisterErrorCallback(api, map: map, result: result)
        case .SKAD_POSTBACK_ERROR_CALLBACK: callSkadPostbackErrorCallback(api, map: map, result: result)
        case .AFFISE_BUILDER: callAffiseBuilder(api, map: map, result: result)

        default:
            result?.notImplemented()
        }
    }

    private func callInit(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        guard let app = self.app else {
            result?.error("api [\(api.method)]: no application context")
            return
        }

        guard let data: [String: Any?] = map.opt(api) else {
            result?.error("api [\(api.method)]: value not set")
            return
        }

        Affise.load(app: app, initProperties: data.toAffiseInitProperties, launchOptions: launchOptions)

        result?.success(nil)
    }

    private func callIsInitialized(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        result?.success(Affise.isInitialized())
    }

    private func callSendEvents(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        Affise.sendEvents()
        result?.success(nil)
    }

    private func callSendEvent(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        guard let data: [String: Any?] = map.opt(api) else {
            result?.error("api [\(api.method)]: value not set")
            return
        }

        guard let event = factory.create(data) else {
            result?.error("api [\(api.method)]: not valid event")
            return
        }

        Affise.sendEvent(event)
        result?.success(nil)
    }

    private func callAddPushToken(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        guard let pushToken: String = map.opt(api) else {
            result?.error("api [\(api.method)]: value not set")
            return
        }

        Affise.addPushToken(pushToken)
        result?.success(nil)
    }

    private func callRegisterWebView(_: AffiseApiMethod, map: [String: Any?]?, result: AffiseResult?) {
        // Affise.registerWebView(webView)
        result?.notImplemented()
    }

    private func callUnregisterWebView(_: AffiseApiMethod, map: [String: Any?]?, result: AffiseResult?) {
        // Affise.unregisterWebView()
        result?.notImplemented()
    }

    private func callSetSecretId(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        guard let secretKey: String = map.opt(api) else {
            result?.error("api [\(api.method)]: value not set")
            return
        }

        Affise.setSecretKey(secretKey)
        result?.success(nil)
    }

    private func callSetAutoCatchingTypes(_: AffiseApiMethod, map: [String: Any?]?, result: AffiseResult?) {
        result?.notImplemented()
    }

    private func callSetOfflineModeEnabled(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        guard let enabled: Bool = map.opt(api) else {
            result?.error("api [\(api.method)]: value not set")
            return
        }

        Affise.setOfflineModeEnabled(enabled)
        result?.success(nil)
    }

    private func callIsOfflineModeEnabled(_: AffiseApiMethod, map: [String: Any?]?, result: AffiseResult?) {
        result?.success(Affise.isOfflineModeEnabled())
    }

    private func callSetBackgroundTrackingEnabled(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        guard let enabled: Bool = map.opt(api) else {
            result?.error("api [\(api.method)]: value not set")
            return
        }

        Affise.setBackgroundTrackingEnabled(enabled)
        result?.success(nil)
    }

    func callIsBackgroundTrackingEnabled(_: AffiseApiMethod, map: [String: Any?]?, result: AffiseResult?) {
        result?.success(Affise.isBackgroundTrackingEnabled())
    }

    private func callSetTrackingEnabled(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        guard let enabled: Bool = map.opt(api) else {
            result?.error("api [\(api.method)]: value not set")
            return
        }

        Affise.setTrackingEnabled(enabled)
        result?.success(nil)
    }

    private func callIsTrackingEnabled(_: AffiseApiMethod, map: [String: Any?]?, result: AffiseResult?) {
        result?.success(Affise.isTrackingEnabled())
    }

    private func callForget(_: AffiseApiMethod, map: [String: Any?]?, result: AffiseResult?) {
        result?.notImplemented()
    }

    private func callSetEnabledMetrics(_: AffiseApiMethod, map: [String: Any?]?, result: AffiseResult?) {
        result?.notImplemented()
    }

    private func callCrashApplication(_: AffiseApiMethod, map: [String: Any?]?, result: AffiseResult?) {
        result?.notImplemented()
    }

    private func callGetRandomUserId(_: AffiseApiMethod, map: [String: Any?]?, result: AffiseResult?) {
        result?.success(Affise.getRandomUserId())
    }

    private func callGetRandomDeviceId(_: AffiseApiMethod, map: [String: Any?]?, result: AffiseResult?) {
        result?.success(Affise.getRandomDeviceId())
    }

    private func callGetProviders(_: AffiseApiMethod, map: [String: Any?]?, result: AffiseResult?) {
        let data: [String:Any?] = Affise.getProviders().reduce(into: [:]) { dict, provider in
            dict[provider.key.provider]=provider.value
        }
        result?.success(data)
    }

    private func callGetReferrer(_: AffiseApiMethod, map: [String: Any?]?, result: AffiseResult?) {
        result?.notImplemented()
    }

    private func callGetReferrerValue(_: AffiseApiMethod, map: [String: Any?]?, result: AffiseResult?) {
        result?.notImplemented()
    }

    private func callGetStatusCallback(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        guard let uuid: String = map.opt(UUID) else {
            result?.error("api [\(api.method)]: no valid Callback UUID")
            return
        }

        guard let name: String = map.opt(api) else {
            result?.error("api [\(api.method)]: value not set")
            return
        }

        guard let module: AffiseModules = AffiseModules.from(name) else {
            result?.error("api [\(api.method)]: no valid AffiseModules")
            return
        }

        Affise.getStatus(module) { status in
            let data: [String: Any?] = [
                self.UUID: uuid,
                api.method: status.toListOfMap(),
            ]
            self.callback?(api.method, data)
        }
        result?.success(nil)
    }

    private func callRegisterDeeplinkCallback(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        guard let uuid: String = map.opt(UUID) else {
            result?.error("api [\(api.method)]: no valid Callback UUID")
            return
        }

        Affise.registerDeeplinkCallback { uri in
            let data: [String: Any?] = [
                self.UUID: uuid,
                api.method: uri.absoluteString,
            ]
            self.callback?(api.method, data)
        }
        result?.success(nil)
    }

    private func callSkadRegisterErrorCallback(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        guard let uuid: String = map.opt(UUID) else {
            result?.error("api [\(api.method)]: no valid Callback UUID")
            return
        }

        SKAdWrapper.register(result) { error in
            let data: [String: Any?] = [
                self.UUID: uuid,
                api.method: error,
            ]
            self.callback?(api.method, data)
        }
    }

    private func callSkadPostbackErrorCallback(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        guard let uuid: String = map.opt(UUID) else {
            result?.error("api [\(api.method)]: no valid Callback UUID")
            return
        }

        guard let data: [String: Any?] = map.opt(api) else {
            result?.error("api [\(api.method)]: value not set")
            return
        }
     
        guard let fineValue: NSNumber = data.opt("fineValue") else {
            result?.error("api [\(api.method)]: fineValue not set")
            return
        }
        
        let coarseValue: String? = data.opt("coarseValue")

        SKAdWrapper.postback(result, fineValue: fineValue.intValue, coarseValue: coarseValue) { error in
            let data: [String: Any?] = [
                self.UUID: uuid,
                api.method: error,
            ]
            self.callback?(api.method, data)
        }
    }
    
    private func callAffiseBuilder(_ api: AffiseApiMethod, map: [String: Any?], result: AffiseResult?) {
        affiseBuilder.call(api, map, result)
    }
}
