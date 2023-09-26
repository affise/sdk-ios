/**
 * Event TrialInRetry use [data] of event and [userData]
 */
@objc
public class TrialInRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_ENTERED_BILLING_RETRY.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_TRIAL_IN_RETRY.typeName }
}

/**
 * Event OfferInRetry use [data] of event and [userData]
 */
@objc
public class OfferInRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_ENTERED_BILLING_RETRY.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_OFFER_IN_RETRY.typeName }
}

/**
 * Event SubscriptionInRetry use [data] of event and [userData]
 */
@objc
public class SubscriptionInRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_ENTERED_BILLING_RETRY.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_SUBSCRIPTION_IN_RETRY.typeName }
}
