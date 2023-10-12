/**
 * Event Contact
 *
 */
@objc
public class ContactEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.CONTACT.eventName
    }
}