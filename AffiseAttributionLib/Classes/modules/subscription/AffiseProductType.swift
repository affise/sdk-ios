import Foundation


@objc
public enum AffiseProductType: Int {

    case CONSUMABLE
    case NON_CONSUMABLE
    case RENEWABLE_SUBSCRIPTION
    case NON_RENEWABLE_SUBSCRIPTION

    public var enumValue: String {
        switch self {
        case .CONSUMABLE: return "consumable"
        case .NON_CONSUMABLE: return "non_consumable"
        case .RENEWABLE_SUBSCRIPTION: return "renewable_subscription"
        case .NON_RENEWABLE_SUBSCRIPTION: return "non_renewable_subscription"
        }
    }
}

extension AffiseProductType: CaseIterable, CustomStringConvertible {
    
    public var description: String { enumValue }
    
    public static func from(_ name: String?) -> AffiseProductType? {
        guard let name = name else { return nil }
        return allCases.first { name == $0.enumValue }
    }
}
