public enum SubscriptionEventName: String {
    case AFFISE_SUBSCRIPTION_ACTIVATION = "affise_subscription_activation"
    case AFFISE_SUBSCRIPTION_CANCELLATION = "affise_subscription_cancellation"
    case AFFISE_SUBSCRIPTION_ENTERED_BILLING_RETRY = "affise_subscription_entered_billing_retry"
    case AFFISE_SUBSCRIPTION_FIRST_CONVERSION = "affise_subscription_first_conversion"
    case AFFISE_SUBSCRIPTION_REACTIVATION = "affise_subscription_reactivation"
    case AFFISE_SUBSCRIPTION_RENEWAL = "affise_subscription_renewal"
    case AFFISE_SUBSCRIPTION_RENEWAL_FROM_BILLING_RETRY = "affise_subscription_renewal_from_billing_retry"
    case AFFISE_UNSUBSCRIPTION = "affise_unsubscription"
}

extension SubscriptionEventName: CaseIterable {
    public var eventName: String {
        return self.rawValue
    }
    
    public static func from(_ name: String) -> SubscriptionEventName? {
        return allCases.first { name == $0.rawValue }
    }
}
