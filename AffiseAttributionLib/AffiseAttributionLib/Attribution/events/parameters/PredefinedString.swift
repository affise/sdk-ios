@objc
public enum PredefinedString: Int, Predefined {
    case ADREV_AD_TYPE
    case CITY
    case COUNTRY
    case REGION
    case CLASS
    case CONTENT_ID
    case CONTENT_TYPE
    case CURRENCY
    case CUSTOMER_USER_ID
    case DESCRIPTION
    case DESTINATION_A
    case DESTINATION_B
    case DESTINATION_LIST
    case ORDER_ID
    case PAYMENT_INFO_AVAILABLE
    case PREFERRED_NEIGHBORHOODS
    case PURCHASE_CURRENCY
    case RECEIPT_ID
    case REGISTRATION_METHOD
    case SEARCH_STRING
    case SUBSCRIPTION_ID
    case SUCCESS
    case SUGGESTED_DESTINATIONS
    case SUGGESTED_HOTELS
    case VALIDATED
    case ACHIEVEMENT_ID
    case COUPON_CODE
    case CUSTOMER_SEGMENT
    case DEEP_LINK
    case NEW_VERSION
    case OLD_VERSION
    case PARAM_01
    case PARAM_02
    case PARAM_03
    case PARAM_04
    case PARAM_05
    case PARAM_06
    case PARAM_07
    case PARAM_08
    case PARAM_09
    case PARAM_10
    case REVIEW_TEXT
    case TUTORIAL_ID
    case VIRTUAL_CURRENCY_NAME
    case STATUS

    func value() -> String {
        switch self {
        case .ADREV_AD_TYPE: return "affise_p_adrev_ad_type"
        case .CITY: return "affise_p_city"
        case .COUNTRY: return "affise_p_country"
        case .REGION: return "affise_p_region"
        case .CLASS: return "affise_p_class"
        case .CONTENT_ID: return "affise_p_content_id"
        case .CONTENT_TYPE: return "affise_p_content_type"
        case .CURRENCY: return "affise_p_currency"
        case .CUSTOMER_USER_ID: return "affise_p_customer_user_id"
        case .DESCRIPTION: return "affise_p_description"
        case .DESTINATION_A: return "affise_p_destination_a"
        case .DESTINATION_B: return "affise_p_destination_b"
        case .DESTINATION_LIST: return "affise_p_destination_list"
        case .ORDER_ID: return "affise_p_order_id"
        case .PAYMENT_INFO_AVAILABLE: return "affise_p_payment_info_available"
        case .PREFERRED_NEIGHBORHOODS: return "affise_p_preferred_neighborhoods"
        case .PURCHASE_CURRENCY: return "affise_p_purchase_currency"
        case .RECEIPT_ID: return "affise_p_receipt_id"
        case .REGISTRATION_METHOD: return "affise_p_registration_method"
        case .SEARCH_STRING: return "affise_p_search_string"
        case .SUBSCRIPTION_ID: return "affise_p_subscription_id"
        case .SUCCESS: return "affise_p_success"
        case .SUGGESTED_DESTINATIONS: return "affise_p_suggested_destinations"
        case .SUGGESTED_HOTELS: return "affise_p_suggested_hotels"
        case .VALIDATED: return "affise_p_validated"
        case .ACHIEVEMENT_ID: return "affise_p_achievement_id"
        case .COUPON_CODE: return "affise_p_coupon_code"
        case .CUSTOMER_SEGMENT: return "affise_p_customer_segment"
        case .DEEP_LINK: return "affise_p_deep_link"
        case .NEW_VERSION: return "affise_p_new_version"
        case .OLD_VERSION: return "affise_p_old_version"
        case .PARAM_01: return "affise_p_param_01"
        case .PARAM_02: return "affise_p_param_02"
        case .PARAM_03: return "affise_p_param_03"
        case .PARAM_04: return "affise_p_param_04"
        case .PARAM_05: return "affise_p_param_05"
        case .PARAM_06: return "affise_p_param_06"
        case .PARAM_07: return "affise_p_param_07"
        case .PARAM_08: return "affise_p_param_08"
        case .PARAM_09: return "affise_p_param_09"
        case .PARAM_10: return "affise_p_param_10"
        case .REVIEW_TEXT: return "affise_p_review_text"
        case .TUTORIAL_ID: return "affise_p_tutorial_id"
        case .VIRTUAL_CURRENCY_NAME: return "affise_p_virtual_currency_name"
        case .STATUS: return "affise_p_status"
        }
    }
}