import Foundation
import AffiseAttributionLib

/**
 * Event AfFailedPurchase use
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
internal class AfFailedPurchaseEvent : NativeEvent {

    override public func getName() -> String {
        return SubscriptionEventName.AF_FAILED_PURCHASE.eventName
    }
}