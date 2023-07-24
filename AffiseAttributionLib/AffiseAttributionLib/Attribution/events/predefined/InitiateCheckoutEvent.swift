/**
 * Event InitiateCheckoutEvent
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class InitiateCheckoutEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.INITIATE_CHECKOUT.eventName
    }
}