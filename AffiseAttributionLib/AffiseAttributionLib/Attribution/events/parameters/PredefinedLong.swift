@objc
public enum PredefinedLong: Int, Predefined {
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
    
    func value() -> String {
        switch self {
        case .DATE_A: return "affise_p_date_a"
        case .DATE_B: return "affise_p_date_b"
        case .DEPARTING_ARRIVAL_DATE: return "affise_p_departing_arrival_date"
        case .DEPARTING_DEPARTURE_DATE: return "affise_p_departing_departure_date"
        case .HOTEL_SCORE: return "affise_p_hotel_score"
        case .LEVEL: return "affise_p_level"
        case .MAX_RATING_VALUE: return "affise_p_max_rating_value"
        case .NUM_ADULTS: return "affise_p_num_adults"
        case .NUM_CHILDREN: return "affise_p_num_children"
        case .NUM_INFANTS: return "affise_p_num_infants"
        case .PREFERRED_NUM_STOPS: return "affise_p_preferred_num_stops"
        case .PREFERRED_STAR_RATINGS: return "affise_p_preferred_star_ratings"
        case .QUANTITY: return "affise_p_quantity"
        case .RATING_VALUE: return "affise_p_rating_value"
        case .RETURNING_ARRIVAL_DATE: return "affise_p_returning_arrival_date"
        case .RETURNING_DEPARTURE_DATE: return "affise_p_returning_departure_date"
        case .SCORE: return "affise_p_score"
        case .TRAVEL_START: return "affise_p_travel_start"
        case .TRAVEL_END: return "affise_p_travel_end"
        case .USER_SCORE: return "affise_p_user_score"
        case .EVENT_START: return "affise_p_event_start"
        case .EVENT_END: return "affise_p_event_end"
        }
    }
}
