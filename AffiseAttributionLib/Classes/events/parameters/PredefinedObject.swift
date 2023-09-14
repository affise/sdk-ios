@objc
public enum PredefinedObject: Int{
    case CONTENT
    
    var enumValue: String {
        switch self {
        case .CONTENT: return "content"
        }
    }
}

extension PredefinedObject: Predefined, CaseIterable {
    
    public func value() -> String {
        return "\(PredefinedConstants.PREFIX)\(enumValue)"
    }
    
    public static func from(_ name: String) -> PredefinedObject? {
        return allCases.first { name == $0.value() }
    }
}
