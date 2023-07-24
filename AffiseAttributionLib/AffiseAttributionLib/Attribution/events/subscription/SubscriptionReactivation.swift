
/**
 * Event ReactivatedSubscription use [data] of event and [userData]
 */
@objc
public class ReactivatedSubscriptionEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_REACTIVATION }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_REACTIVATED_SUBSCRIPTION }
}
