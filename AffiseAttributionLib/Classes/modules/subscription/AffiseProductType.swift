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
