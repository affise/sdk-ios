import Foundation

/**
 * Event Login
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class LoginEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.LOGIN.eventName
    }
}
