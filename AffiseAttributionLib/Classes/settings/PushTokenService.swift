import Foundation

@objc
public enum PushTokenService: Int {
    case FIREBASE
    case APPLE

    public var service: String {
        switch self {
        case .FIREBASE: return "fms"
        case .APPLE: return "apns"
        }
    }
}

extension PushTokenService: CaseIterable {
    
    public static func from(_ service: String?) -> PushTokenService? {
        guard let service = service else { return nil }
        return allCases.first { service == $0.service }
    }
}
