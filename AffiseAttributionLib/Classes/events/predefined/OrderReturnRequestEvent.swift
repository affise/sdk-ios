/**
 * Event OrderReturnRequest
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class OrderReturnRequestEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.ORDER_RETURN_REQUEST.eventName
    }
}