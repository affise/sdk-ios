import Foundation


/**
 * Event Unsubscription use [data] of event and [userData]
 */
@objc
public class UnsubscriptionEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_UNSUBSCRIPTION.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_UNSUBSCRIPTION.rawValue }
}
