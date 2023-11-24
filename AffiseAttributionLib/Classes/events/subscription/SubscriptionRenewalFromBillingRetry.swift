import Foundation

/**
 * Event ConvertedTrialFromRetry use [data] of event and [userData]
 */
@objc
public class ConvertedTrialFromRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_RENEWAL_FROM_BILLING_RETRY.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_CONVERTED_TRIAL_FROM_RETRY.typeName }
}

/**
 * Event ConvertedOfferFromRetry use [data] of event and [userData]
 */
@objc
public class ConvertedOfferFromRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_RENEWAL_FROM_BILLING_RETRY.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_CONVERTED_OFFER_FROM_RETRY.typeName }
}

/**
 * Event RenewedSubscriptionFromRetry use [data] of event and [userData]
 */
@objc
public class RenewedSubscriptionFromRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_RENEWAL_FROM_BILLING_RETRY.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_RENEWED_SUBSCRIPTION_FROM_RETRY.typeName }
}
