@objc
public enum ValidationStatus: Int {
    case VALID
    case INVALID_APP_ID
    case INVALID_SECRET_KEY
    case PACKAGE_NAME_NOT_FOUND
    case NOT_WORKING_ON_PRODUCTION
    case NETWORK_ERROR
    case UNKNOWN_ERROR

    public var status: String {
        switch self {
        case .VALID: return "valid"
        case .INVALID_APP_ID: return "invalid_app_id"
        case .INVALID_SECRET_KEY: return "invalid_secret_key"
        case .PACKAGE_NAME_NOT_FOUND: return "package_name_not_found"
        case .NOT_WORKING_ON_PRODUCTION: return "not_working_on_production"
        case .NETWORK_ERROR: return "network_error"
        case .UNKNOWN_ERROR: return "unknown_error"
        }
    }
}
    
extension ValidationStatus: CaseIterable, CustomStringConvertible {
    public var description: String { status }

    public static func from(_ name: String?) -> ValidationStatus? {
        if name == nil { return nil }
        return allCases.first { name == $0.status }
    }
}
