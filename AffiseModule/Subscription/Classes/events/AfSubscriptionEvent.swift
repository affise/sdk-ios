import Foundation
import AffiseAttributionLib

/**
 * Event AfSubscription use
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
// @objc
internal class AfSubscriptionEvent : NativeEvent {

    override public func getName() -> String {
        return SubscriptionEventName.AF_SUBSCRIPTION.eventName
    }
}