import Foundation
import AffiseAttributionLib

/**
 * Event AfPurchase use
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
// @objc
internal class AfPurchaseEvent : NativeEvent {

    override public func getName() -> String {
        return SubscriptionEventName.AF_PURCHASE.eventName
    }
}