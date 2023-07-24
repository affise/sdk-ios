@objc
public enum PredefinedFloat: Int, Predefined, CaseIterable {
    case PREFERRED_PRICE_RANGE
    case PRICE
    case REVENUE
    case LAT
    case LONG

    public func value() -> String {
        switch self {
        case .PREFERRED_PRICE_RANGE: return "affise_p_preferred_price_range"
        case .PRICE: return "affise_p_price"
        case .REVENUE: return "affise_p_revenue"
        case .LAT: return "affise_p_lat"
        case .LONG: return "affise_p_long"
        }
    }

    public static func from(_ name: String) -> PredefinedFloat? {
        return allCases.first { name == $0.value() }
    }
}
