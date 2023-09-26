/**
 * Event Unsubscription use [data] of event and [userData]
 */
@objc
public class UnsubscriptionEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionEventName.AFFISE_UNSUBSCRIPTION.eventName }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionSubType.AFFISE_SUB_UNSUBSCRIPTION.typeName }
}
