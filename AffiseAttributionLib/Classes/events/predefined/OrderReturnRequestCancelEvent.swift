import Foundation

/**
 * Event OrderReturnRequestCancel
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class OrderReturnRequestCancelEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.ORDER_RETURN_REQUEST.eventName
    }
}