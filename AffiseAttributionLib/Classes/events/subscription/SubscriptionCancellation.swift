import Foundation

/**
 * Event FailedTrial use [data] of event and [userData]
 */
@objc
public class FailedTrialEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_CANCELLATION.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_FAILED_TRIAL.typeName }
}

/**
 * Event FailedOfferise use [data] of event and [userData]
 */
@objc
public class FailedOfferiseEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_CANCELLATION.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_FAILED_OFFERISE.typeName }
}

/**
 * Event FailedSubscription use [data] of event and [userData]
 */
@objc
public class FailedSubscriptionEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_CANCELLATION.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_FAILED_SUBSCRIPTION.typeName }
}

/**
 * Event FailedTrialFromRetry use [data] of event and [userData]
 */
@objc
public class FailedTrialFromRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_CANCELLATION.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_FAILED_TRIAL_FROM_RETRY.typeName }
}

/**
 * Event FailedOfferFromRetry use [data] of event and [userData]
 */
@objc
public class FailedOfferFromRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_CANCELLATION.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_FAILED_OFFER_FROM_RETRY.typeName }
}

/**
 * Event FailedSubscriptionFromRetry use [data] of event and [userData]
 */
@objc
public class FailedSubscriptionFromRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_CANCELLATION.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_FAILED_SUBSCRIPTION_FROM_RETRY.typeName }
}
