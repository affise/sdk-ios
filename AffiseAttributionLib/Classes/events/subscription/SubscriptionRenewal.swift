/**
 * Event RenewedSubscription use [data] of event and [userData]
 */
@objc
public class RenewedSubscriptionEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_RENEWAL.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_RENEWED_SUBSCRIPTION.typeName }
}
