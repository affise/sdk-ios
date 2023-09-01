@objc
public enum AffiseModules: Int, CaseIterable, CustomStringConvertible {
    case Status
    
    internal func enumValue() -> String {
        switch self {
        case .Status: return "Status"
        }
    }
    
    internal func value() -> String { "\(AffiseModules.PREFIX).\(self.enumValue())Module" }

    public var description: String { enumValue() }
    
    internal static func values() -> [AffiseModules] {
        return allCases
    }
    
    internal static let PREFIX: String = "AffiseModule"
    
    public static func from(_ name: String) -> AffiseModules? {
        return allCases.first { $0.value().contains(name)  }
    }
}
