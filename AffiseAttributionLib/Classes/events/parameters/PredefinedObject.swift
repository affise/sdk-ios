@objc
public enum PredefinedObject: Int, Predefined, CaseIterable {
    case CONTENT
    
    public func value() -> String { 
        return "\(PredefinedConstants.PREFIX)\(enumValue())"
    }

    func enumValue() -> String {
        switch self {
        case .CONTENT: return "content"
        }
    }

    public static func from(_ name: String) -> PredefinedObject? {
        return allCases.first { name == $0.value() }
    }
}
