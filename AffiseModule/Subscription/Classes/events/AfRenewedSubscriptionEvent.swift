import Foundation
import AffiseAttributionLib

/**
 * Event AfRenewedSubscription use
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
// @objc
internal class AfRenewedSubscriptionEvent : NativeEvent {

    override public func getName() -> String {
        return SubscriptionEventName.AF_RENEWED_SUBSCRIPTION.eventName
    }
}