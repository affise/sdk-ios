/**
 * Event OrderEvent
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class OrderEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.ORDER.eventName
    }
}