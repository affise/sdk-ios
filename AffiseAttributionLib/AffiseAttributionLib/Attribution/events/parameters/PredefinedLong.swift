@objc
public enum PredefinedLong: Int, Predefined, CaseIterable {
    case AMOUNT
    case DATE_A
    case DATE_B
    case DEPARTING_ARRIVAL_DATE
    case DEPARTING_DEPARTURE_DATE
    case HOTEL_SCORE
    case LEVEL
    case MAX_RATING_VALUE
    case NUM_ADULTS
    case NUM_CHILDREN
    case NUM_INFANTS
    case PREFERRED_NUM_STOPS
    case PREFERRED_STAR_RATINGS
    case QUANTITY
    case RATING_VALUE
    case RETURNING_ARRIVAL_DATE
    case RETURNING_DEPARTURE_DATE
    case SCORE
    case TRAVEL_START
    case TRAVEL_END
    case USER_SCORE
    case EVENT_START
    case EVENT_END
    
    public func value() -> String { 
        return "\(PredefinedConstants.PREFIX)\(enumValue())"
    }

    func enumValue() -> String {
        switch self {
        case .AMOUNT: return "amount"
        case .DATE_A: return "date_a"
        case .DATE_B: return "date_b"
        case .DEPARTING_ARRIVAL_DATE: return "departing_arrival_date"
        case .DEPARTING_DEPARTURE_DATE: return "departing_departure_date"
        case .HOTEL_SCORE: return "hotel_score"
        case .LEVEL: return "level"
        case .MAX_RATING_VALUE: return "max_rating_value"
        case .NUM_ADULTS: return "num_adults"
        case .NUM_CHILDREN: return "num_children"
        case .NUM_INFANTS: return "num_infants"
        case .PREFERRED_NUM_STOPS: return "preferred_num_stops"
        case .PREFERRED_STAR_RATINGS: return "preferred_star_ratings"
        case .QUANTITY: return "quantity"
        case .RATING_VALUE: return "rating_value"
        case .RETURNING_ARRIVAL_DATE: return "returning_arrival_date"
        case .RETURNING_DEPARTURE_DATE: return "returning_departure_date"
        case .SCORE: return "score"
        case .TRAVEL_START: return "travel_start"
        case .TRAVEL_END: return "travel_end"
        case .USER_SCORE: return "user_score"
        case .EVENT_START: return "event_start"
        case .EVENT_END: return "event_end"
        }
    }

    public static func from(_ name: String) -> PredefinedLong? {
        return allCases.first { name == $0.value() }
    }
}
