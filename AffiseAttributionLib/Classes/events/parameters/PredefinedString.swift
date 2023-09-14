@objc
public enum PredefinedString: Int {
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
    case BRAND
    case BRICK
    case CATALOGUE_ID
    case CHANNEL_TYPE
    case CUSTOMER_TYPE
    case SEGMENT
    case UTM_CAMPAIGN
    case UTM_MEDIUM
    case UTM_SOURCE
    case VERTICAL
    case VOUCHER_CODE
    case CLICK_ID
    case CAMPAIGN_ID
    case EVENT_NAME
    case PID
    case PRODUCT_ID
    case CONVERSION_ID
    case CONTENT_NAME
    case PRODUCT_NAME
    case SOURCE
    case NETWORK
    case UNIT
    case PLACEMENT

    var enumValue: String {
        switch self {
        case .ADREV_AD_TYPE: return "adrev_ad_type"
        case .CITY: return "city"
        case .COUNTRY: return "country"
        case .REGION: return "region"
        case .CLASS: return "class"
        case .CONTENT_ID: return "content_id"
        case .CONTENT_TYPE: return "content_type"
        case .CURRENCY: return "currency"
        case .CUSTOMER_USER_ID: return "customer_user_id"
        case .DESCRIPTION: return "description"
        case .DESTINATION_A: return "destination_a"
        case .DESTINATION_B: return "destination_b"
        case .DESTINATION_LIST: return "destination_list"
        case .ORDER_ID: return "order_id"
        case .PAYMENT_INFO_AVAILABLE: return "payment_info_available"
        case .PREFERRED_NEIGHBORHOODS: return "preferred_neighborhoods"
        case .PURCHASE_CURRENCY: return "purchase_currency"
        case .RECEIPT_ID: return "receipt_id"
        case .REGISTRATION_METHOD: return "registration_method"
        case .SEARCH_STRING: return "search_string"
        case .SUBSCRIPTION_ID: return "subscription_id"
        case .SUCCESS: return "success"
        case .SUGGESTED_DESTINATIONS: return "suggested_destinations"
        case .SUGGESTED_HOTELS: return "suggested_hotels"
        case .VALIDATED: return "validated"
        case .ACHIEVEMENT_ID: return "achievement_id"
        case .COUPON_CODE: return "coupon_code"
        case .CUSTOMER_SEGMENT: return "customer_segment"
        case .DEEP_LINK: return "deep_link"
        case .NEW_VERSION: return "new_version"
        case .OLD_VERSION: return "old_version"
        case .PARAM_01: return "param_01"
        case .PARAM_02: return "param_02"
        case .PARAM_03: return "param_03"
        case .PARAM_04: return "param_04"
        case .PARAM_05: return "param_05"
        case .PARAM_06: return "param_06"
        case .PARAM_07: return "param_07"
        case .PARAM_08: return "param_08"
        case .PARAM_09: return "param_09"
        case .PARAM_10: return "param_10"
        case .REVIEW_TEXT: return "review_text"
        case .TUTORIAL_ID: return "tutorial_id"
        case .VIRTUAL_CURRENCY_NAME: return "virtual_currency_name"
        case .STATUS: return "status"
        case .BRAND: return "brand"
        case .BRICK: return "brick"
        case .CATALOGUE_ID: return "catalogue_id"
        case .CHANNEL_TYPE: return "channel_type"
        case .CUSTOMER_TYPE: return "customer_type"
        case .SEGMENT: return "segment"
        case .UTM_CAMPAIGN: return "utm_campaign"
        case .UTM_MEDIUM: return "utm_medium"
        case .UTM_SOURCE: return "utm_source"
        case .VERTICAL: return "vertical"
        case .VOUCHER_CODE: return "voucher_code"
        case .CLICK_ID: return "click_id"
        case .CAMPAIGN_ID: return "campaign_id"
        case .EVENT_NAME: return "event_name"
        case .PID: return "pid"
        case .PRODUCT_ID: return "product_id"
        case .CONVERSION_ID: return "conversion_id"
        case .CONTENT_NAME: return "content_name"
        case .PRODUCT_NAME: return "product_name"
        case .SOURCE: return "source"
        case .NETWORK: return "network"
        case .UNIT: return "unit"
        case .PLACEMENT: return "placement"
        }
    }
}

extension PredefinedString: Predefined, CaseIterable {
    
    public func value() -> String {
        return "\(PredefinedConstants.PREFIX)\(enumValue)"
    }
    
    public static func from(_ name: String) -> PredefinedString? {
        return allCases.first { name == $0.value() }
    }
}
