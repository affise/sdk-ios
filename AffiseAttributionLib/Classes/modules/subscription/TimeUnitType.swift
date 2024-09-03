import Foundation


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

extension TimeUnitType: CaseIterable, CustomStringConvertible  {
    
    public var description: String { return self.enumValue }
    
    public static func from(_ name: String?) -> TimeUnitType? {
        guard let name = name else { return nil }
        return allCases.first { name == $0.enumValue }
    }
}
