import Foundation

/**
 * Event InitialSubscription use [data] of event and [userData]
 */
@objc
public class InitialSubscriptionEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_ACTIVATION.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_INITIAL_SUBSCRIPTION.typeName }
}

/**
 * Event InitialTrial use [data] of event and [userData]
 */
@objc
public class InitialTrialEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_ACTIVATION.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_INITIAL_TRIAL.typeName }
}

/**
 * Event of InitialOffer use [data] of event and [userData]
 */
@objc
public class InitialOfferEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_ACTIVATION.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_INITIAL_OFFER.typeName }
}
