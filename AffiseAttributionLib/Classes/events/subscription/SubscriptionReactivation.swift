import Foundation

/**
 * Event ReactivatedSubscription use [data] of event and [userData]
 */
@objc
public class ReactivatedSubscriptionEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_SUBSCRIPTION_REACTIVATION.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_REACTIVATED_SUBSCRIPTION.typeName }
}
