import Foundation

/**
 * Event StartRegistration
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class StartRegistrationEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.START_REGISTRATION.eventName
    }
}
