@objc
public enum PredefinedFloat: Int, Predefined, CaseIterable {
    case PREFERRED_PRICE_RANGE
    case PRICE
    case REVENUE
    case LAT
    case LONG

    public func value() -> String { 
        return "\(PredefinedConstants.PREFIX)\(enumValue())"
    }

    func enumValue() -> String {
        switch self {
        case .PREFERRED_PRICE_RANGE: return "preferred_price_range"
        case .PRICE: return "price"
        case .REVENUE: return "revenue"
        case .LAT: return "lat"
        case .LONG: return "long"
        }
    }

    public static func from(_ name: String) -> PredefinedFloat? {
        return allCases.first { name == $0.value() }
    }
}
