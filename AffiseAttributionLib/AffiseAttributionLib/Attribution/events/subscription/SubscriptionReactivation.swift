
/**
 * Event ReactivatedSubscription use [data] of event and [userData]
 */
@objc
public class ReactivatedSubscriptionEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_REACTIVATION.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_REACTIVATED_SUBSCRIPTION.rawValue }
}
