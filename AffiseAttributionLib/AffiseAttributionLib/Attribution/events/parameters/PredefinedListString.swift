@objc
public enum PredefinedListString: Int, Predefined, CaseIterable {
    case CONTENT_IDS

    public func value() -> String {
        switch self {
        case .CONTENT_IDS: return "affise_p_content_ids"
        }
    }

    public static func from(_ name: String) -> PredefinedListString? {
        return allCases.first { name == $0.value() }
    }
}
