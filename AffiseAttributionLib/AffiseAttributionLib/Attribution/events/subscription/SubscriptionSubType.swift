public enum SubscriptionSubType: String, CaseIterable {
    case AFFISE_SUB_INITIAL_SUBSCRIPTION = "affise_sub_initial_subscription"
    case AFFISE_SUB_INITIAL_TRIAL = "affise_sub_initial_trial"
    case AFFISE_SUB_INITIAL_OFFER = "affise_sub_initial_offer"
    case AFFISE_SUB_FAILED_TRIAL = "affise_sub_failed_trial"
    case AFFISE_SUB_FAILED_OFFERISE = "affise_sub_failed_offer"
    case AFFISE_SUB_FAILED_SUBSCRIPTION = "affise_sub_failed_subscription"
    case AFFISE_SUB_FAILED_TRIAL_FROM_RETRY = "affise_sub_failed_trial_from_retry"
    case AFFISE_SUB_FAILED_OFFER_FROM_RETRY = "affise_sub_failed_offer_from_retry"
    case AFFISE_SUB_FAILED_SUBSCRIPTION_FROM_RETRY = "affise_sub_failed_subscription_from_retry"
    case AFFISE_SUB_TRIAL_IN_RETRY = "affise_sub_trial_in_retry"
    case AFFISE_SUB_OFFER_IN_RETRY = "affise_sub_offer_in_retry"
    case AFFISE_SUB_SUBSCRIPTION_IN_RETRY = "affise_sub_subscription_in_retry"
    case AFFISE_SUB_CONVERTED_TRIAL = "affise_sub_converted_trial"
    case AFFISE_SUB_CONVERTED_OFFER = "affise_sub_converted_offer"
    case AFFISE_SUB_REACTIVATED_SUBSCRIPTION = "affise_sub_reactivated_subscription"
    case AFFISE_SUB_RENEWED_SUBSCRIPTION = "affise_sub_renewed_subscription"
    case AFFISE_SUB_CONVERTED_TRIAL_FROM_RETRY = "affise_sub_converted_trial_from_retry"
    case AFFISE_SUB_CONVERTED_OFFER_FROM_RETRY = "affise_sub_converted_offer_from_retry"
    case AFFISE_SUB_RENEWED_SUBSCRIPTION_FROM_RETRY = "affise_sub_renewed_subscription_from_retry"
    case AFFISE_SUB_UNSUBSCRIPTION = "affise_sub_unsubscription"
    
    public var typeName: String {
        return self.rawValue
    }

    public static func from(_ name: String) -> SubscriptionSubType? {
        return allCases.first { name == $0.rawValue }
    }
}
