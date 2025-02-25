import Foundation


@objc
public enum AffiseModules: Int {
    case Advertising
    case Link
    case Persistent
    case Status
    case Subscription
    
    internal var enumValue: String {
        switch self {
        case .Advertising: return "Advertising"
        case .Link: return "Link"
        case .Persistent: return "Persistent"
        case .Status: return "Status"
        case .Subscription: return "Subscription"
        }
    }
}

extension AffiseModules: CaseIterable, CustomStringConvertible {
    
    internal func className() -> String { "Affise\(self.enumValue)Module" }

    internal func classNameModule() -> String { "AffiseModule\(self.enumValue).\(self.enumValue)Module" }
    
    internal static func values() -> [AffiseModules] { allCases }
    
    public var description: String { enumValue }
    
    public static func from(_ name: String) -> AffiseModules? {
        return allCases.first { $0.className().contains(name)  }
    }
}
