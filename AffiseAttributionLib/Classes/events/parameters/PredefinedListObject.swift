@objc
public enum PredefinedListObject: Int {
    case CONTENT_LIST

    var enumValue: String {
        switch self {
        case .CONTENT_LIST: return "content_list"
        }
    }
}

extension PredefinedListObject: Predefined, CaseIterable {
    
    public func value() -> String {
        return "\(PredefinedConstants.PREFIX)\(enumValue)"
    }
    
    public static func from(_ name: String) -> PredefinedListObject? {
        return allCases.first { name == $0.value() }
    }
}
