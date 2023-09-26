/**
 * Event ViewCart
 *
 * @property userData any custom string data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class ViewCartEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.VIEW_CART.eventName
    }
}
