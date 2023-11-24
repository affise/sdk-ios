import Foundation

/**
 * Event OrderCancelEvent
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class OrderCancelEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.ORDER_CANCEL.eventName
    }
}