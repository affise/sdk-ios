import Foundation

@objc
public enum AffiseModules: Int {
    case Advertising
    case Status
    case Subscription
    
    internal var enumValue: String {
        switch self {
        case .Advertising: return "Advertising"
        case .Status: return "Status"
        case .Subscription: return "Subscription"
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
