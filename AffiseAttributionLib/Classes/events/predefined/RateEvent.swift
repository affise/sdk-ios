/**
 * Event Rate use
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class RateEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.RATE.eventName
    }
}
