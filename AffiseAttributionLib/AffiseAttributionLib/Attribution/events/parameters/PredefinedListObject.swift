@objc
public enum PredefinedListObject: Int, Predefined, CaseIterable {
    case CONTENT_LIST

    public func value() -> String {
        switch self {
        case .CONTENT_LIST: return "affise_p_content_list"
        }
    }

    public static func from(_ name: String) -> PredefinedListObject? {
        return allCases.first { name == $0.value() }
    }
}
