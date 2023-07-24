import Foundation


/**
 * Event Unsubscription use [data] of event and [userData]
 */
@objc
public class UnsubscriptionEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_UNSUBSCRIPTION }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_UNSUBSCRIPTION }
}
