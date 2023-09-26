/**
 * Event Rate use
 *
 * @property reEngage the describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class ReEngageEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.RE_ENGAGE.eventName
    }
}
