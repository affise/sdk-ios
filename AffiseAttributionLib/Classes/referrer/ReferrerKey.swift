@objc
public enum ReferrerKey: Int {
    case AD_ID
    case CAMPAIGN_ID
    case CLICK_ID
    case AFFISE_AD
    case AFFISE_AD_ID
    case AFFISE_AD_TYPE
    case AFFISE_ADSET
    case AFFISE_ADSET_ID
    case AFFISE_AFFC_ID
    case AFFISE_CHANNEL
    case AFFISE_CLICK_LOOK_BACK
    case AFFISE_COST_CURRENCY
    case AFFISE_COST_MODEL
    case AFFISE_COST_VALUE
    case AFFISE_DEEPLINK
    case AFFISE_KEYWORDS
    case AFFISE_MEDIA_TYPE
    case AFFISE_MODEL
    case AFFISE_OS
    case AFFISE_PARTNER
    case AFFISE_REF
    case AFFISE_SITE_ID
    case AFFISE_SUB_SITE_ID
    case AFFC
    case PID
    case SUB_1
    case SUB_2
    case SUB_3
    case SUB_4
    case SUB_5
    case AFFISE_SUB_1
    case AFFISE_SUB_2
    case AFFISE_SUB_3
    case AFFISE_SUB_4
    case AFFISE_SUB_5

    var enumValue: String {
        switch self {
        case .AD_ID: return "ad_id"
        case .CAMPAIGN_ID: return "campaign_id"
        case .CLICK_ID: return "clickid"
        case .AFFISE_AD: return "affise_ad"
        case .AFFISE_AD_ID: return "affise_ad_id"
        case .AFFISE_AD_TYPE: return "affise_ad_type"
        case .AFFISE_ADSET: return "affise_adset"
        case .AFFISE_ADSET_ID: return "affise_adset_id"
        case .AFFISE_AFFC_ID: return "affise_affc_id"
        case .AFFISE_CHANNEL: return "affise_channel"
        case .AFFISE_CLICK_LOOK_BACK: return "affise_click_lookback"
        case .AFFISE_COST_CURRENCY: return "affise_cost_currency"
        case .AFFISE_COST_MODEL: return "affise_cost_model"
        case .AFFISE_COST_VALUE: return "affise_cost_value"
        case .AFFISE_DEEPLINK: return "affise_deeplink"
        case .AFFISE_KEYWORDS: return "affise_keywords"
        case .AFFISE_MEDIA_TYPE: return "affise_media_type"
        case .AFFISE_MODEL: return "affise_model"
        case .AFFISE_OS: return "affise_os"
        case .AFFISE_PARTNER: return "affise_partner"
        case .AFFISE_REF: return "affise_ref"
        case .AFFISE_SITE_ID: return "affise_siteid"
        case .AFFISE_SUB_SITE_ID: return "affise_sub_siteid"
        case .AFFC: return "affc"
        case .PID: return "pid"
        case .SUB_1: return "sub1"
        case .SUB_2: return "sub2"
        case .SUB_3: return "sub3"
        case .SUB_4: return "sub4"
        case .SUB_5: return "sub5"
        case .AFFISE_SUB_1: return "affise_sub1"
        case .AFFISE_SUB_2: return "affise_sub2"
        case .AFFISE_SUB_3: return "affise_sub3"
        case .AFFISE_SUB_4: return "affise_sub4"
        case .AFFISE_SUB_5: return "affise_sub5"
        }
    }
}

extension ReferrerKey: CaseIterable, CustomStringConvertible {
    
    public var description: String { enumValue }

    public func value() -> String { enumValue }
    
    public static func from(_ name: String) -> ReferrerKey? {
        return allCases.first { name == $0.enumValue }
    }
}
