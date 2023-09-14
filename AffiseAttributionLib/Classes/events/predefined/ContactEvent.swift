/**
 * Event Contact
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class ContactEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.CONTACT.eventName
    }
}