@objc
public enum PredefinedListObject: Int, Predefined, CaseIterable {
    case CONTENT_LIST

    public func value() -> String { 
        return "\(PredefinedConstants.PREFIX)\(enumValue())"
    }

    func enumValue() -> String {
        switch self {
        case .CONTENT_LIST: return "content_list"
        }
    }

    public static func from(_ name: String) -> PredefinedListObject? {
        return allCases.first { name == $0.value() }
    }
}
