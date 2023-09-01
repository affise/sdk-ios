@objc
public enum PredefinedListString: Int, Predefined, CaseIterable {
    case CONTENT_IDS

    public func value() -> String { 
        return "\(PredefinedConstants.PREFIX)\(enumValue())"
    }

    func enumValue() -> String {
        switch self {
        case .CONTENT_IDS: return "content_ids"
        }
    }

    public static func from(_ name: String) -> PredefinedListString? {
        return allCases.first { name == $0.value() }
    }
}
