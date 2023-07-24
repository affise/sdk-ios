@objc
public enum PredefinedObject: Int, Predefined, CaseIterable {
    case CONTENT
    
    public func value() -> String {
        switch self {
        case .CONTENT: return "affise_p_content"
        }
    }

    public static func from(_ name: String) -> PredefinedObject? {
        return allCases.first { name == $0.value() }
    }
}
