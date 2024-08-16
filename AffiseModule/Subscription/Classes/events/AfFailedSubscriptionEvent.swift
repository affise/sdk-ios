import Foundation
import AffiseAttributionLib

/**
 * Event AfFailedSubscription use
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
internal class AfFailedSubscriptionEvent : NativeEvent {

    override public func getName() -> String {
        return SubscriptionEventName.AF_FAILED_SUBSCRIPTION.eventName
    }
}