@objc
public enum TimeUnitType: Int {

    case DAY
    case WEEK
    case MONTH
    case YEAR

    public var enumValue: String {
        switch self {
        case .DAY: return "day"
        case .WEEK: return "week"
        case .MONTH: return "month"
        case .YEAR: return "year"
        }
    }
}