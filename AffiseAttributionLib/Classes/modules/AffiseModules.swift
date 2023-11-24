import Foundation

@objc
public enum AffiseModules: Int {
    case Status
    
    internal var enumValue: String {
        switch self {
        case .Status: return "Status"
        }
    }
}

extension AffiseModules: CaseIterable, CustomStringConvertible {
    
    internal func value() -> String { "Affise\(self.enumValue)Module" }
    
    internal static func values() -> [AffiseModules] { allCases }
    
    public var description: String { enumValue }
    
    public static func from(_ name: String) -> AffiseModules? {
        return allCases.first { $0.value().contains(name)  }
    }
}
