import Foundation

/**
 * Event Purchase use
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class PurchaseEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.PURCHASE.eventName
    }
}
