import Foundation

@objc
public enum AffiseApiMethod: Int {
    case INIT
    case IS_INITIALIZED
//    case SEND_EVENTS // deprecated
    case SEND_EVENT
    case SEND_EVENT_NOW
    case ADD_PUSH_TOKEN
    case REGISTER_WEB_VIEW
    case UNREGISTER_WEB_VIEW
    case SET_SECRET_ID
    case SET_AUTO_CATCHING_TYPES
    case SET_OFFLINE_MODE_ENABLED
    case IS_OFFLINE_MODE_ENABLED
    case SET_BACKGROUND_TRACKING_ENABLED
    case IS_BACKGROUND_TRACKING_ENABLED
    case SET_TRACKING_ENABLED
    case IS_TRACKING_ENABLED
    case FORGET
    case SET_ENABLED_METRICS
    case CRASH_APPLICATION
    case GET_RANDOM_USER_ID
    case GET_RANDOM_DEVICE_ID
    case GET_PROVIDERS
    case MODULE_START
    case GET_MODULES_INSTALLED
    case IS_FIRST_RUN
    // callback
    case GET_REFERRER_CALLBACK
    case GET_REFERRER_VALUE_CALLBACK
    case GET_STATUS_CALLBACK
    case REGISTER_DEEPLINK_CALLBACK
    case SKAD_REGISTER_ERROR_CALLBACK
    case SKAD_POSTBACK_ERROR_CALLBACK
    // debug
    case DEBUG_VALIDATE_CALLBACK
    case DEBUG_NETWORK_CALLBACK
    // builder
    case AFFISE_BUILDER

    var value: String {
        switch self {
        case .INIT: return "init"
        case .IS_INITIALIZED: return "is_initialized"
        case .SEND_EVENT: return "send_event"
        case .SEND_EVENT_NOW: return "send_event_now"
        case .ADD_PUSH_TOKEN: return "add_push_token"
        case .REGISTER_WEB_VIEW: return "register_web_view"
        case .UNREGISTER_WEB_VIEW: return "unregister_web_view"
        case .SET_SECRET_ID: return "set_secret_id"
        case .SET_AUTO_CATCHING_TYPES: return "set_auto_catching_types"
        case .SET_OFFLINE_MODE_ENABLED: return "set_offline_mode_enabled"
        case .IS_OFFLINE_MODE_ENABLED: return "is_offline_mode_enabled"
        case .SET_BACKGROUND_TRACKING_ENABLED: return "set_background_tracking_enabled"
        case .IS_BACKGROUND_TRACKING_ENABLED: return "is_background_tracking_enabled"
        case .SET_TRACKING_ENABLED: return "set_tracking_enabled"
        case .IS_TRACKING_ENABLED: return "is_tracking_enabled"
        case .FORGET: return "forget"
        case .SET_ENABLED_METRICS: return "set_enabled_metrics"
        case .CRASH_APPLICATION: return "crash_application"
        case .GET_RANDOM_USER_ID: return "get_random_user_id"
        case .GET_RANDOM_DEVICE_ID: return "get_random_device_id"
        case .GET_PROVIDERS: return "get_providers"
        case .MODULE_START: return "module_start"
        case .GET_MODULES_INSTALLED: return "get_modules_installed"
        case .IS_FIRST_RUN: return "is_first_run"
        // callback
        case .GET_REFERRER_CALLBACK: return "get_referrer_callback"
        case .GET_REFERRER_VALUE_CALLBACK: return "get_referrer_value_callback"
        case .GET_STATUS_CALLBACK: return "get_status_callback"
        case .REGISTER_DEEPLINK_CALLBACK: return "register_deeplink_callback"
        case .SKAD_REGISTER_ERROR_CALLBACK: return "skad_register_error_callback"
        case .SKAD_POSTBACK_ERROR_CALLBACK: return "skad_postback_error_callback"
        case .DEBUG_VALIDATE_CALLBACK: return "debug_validate_callback"
        case .DEBUG_NETWORK_CALLBACK: return "debug_network_callback"
        case .AFFISE_BUILDER: return "affise_builder"
        }
    }
}

extension AffiseApiMethod: CaseIterable {
    public var method: String {
        return value
    }
    
    public static func from(_ name: String) -> AffiseApiMethod? {
        return allCases.first { name == $0.value }
    }
}
