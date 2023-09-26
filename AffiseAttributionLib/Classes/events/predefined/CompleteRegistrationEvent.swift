
/**
 * Event CompleteRegistration
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CompleteRegistrationEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.COMPLETE_REGISTRATION.eventName
    }
}
