@objc
public enum PredefinedFloat: Int {
    case PREFERRED_PRICE_RANGE
    case PRICE
    case REVENUE
    case LAT
    case LONG

    var enumValue: String {
        switch self {
        case .PREFERRED_PRICE_RANGE: return "preferred_price_range"
        case .PRICE: return "price"
        case .REVENUE: return "revenue"
        case .LAT: return "lat"
        case .LONG: return "long"
        }
    }
}

extension PredefinedFloat: Predefined, CaseIterable {
    
    public func value() -> String {
        return "\(PredefinedConstants.PREFIX)\(enumValue)"
    }
    
    public static func from(_ name: String) -> PredefinedFloat? {
        return allCases.first { name == $0.value() }
    }
}
