import Foundation

@objc
public enum PredefinedListString: Int {
    case CONTENT_IDS

    var enumValue: String {
        switch self {
        case .CONTENT_IDS: return "content_ids"
        }
    }
}

extension PredefinedListString: Predefined, CaseIterable {
    
    public func value() -> String {
        return "\(PredefinedConstants.PREFIX)\(enumValue)"
    }
    
    public static func from(_ name: String) -> PredefinedListString? {
        return allCases.first { name == $0.value() }
    }
}
