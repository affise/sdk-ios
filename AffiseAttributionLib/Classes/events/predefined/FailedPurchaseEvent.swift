import Foundation

/**
 * Event FailedPurchase use
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class FailedPurchaseEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.FAILED_PURCHASE.eventName
    }
}
