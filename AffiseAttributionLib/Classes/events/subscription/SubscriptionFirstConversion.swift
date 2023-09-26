/**
 * Event ConvertedTrial use [data] of event and [userData]
 */
@objc
public class ConvertedTrialEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_FIRST_CONVERSION.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_CONVERTED_TRIAL.typeName }
}

/**
 * Event ConvertedOffer use [data] of event and [userData]
 */
@objc
public class ConvertedOfferEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_FIRST_CONVERSION.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_CONVERTED_OFFER.typeName }
}
