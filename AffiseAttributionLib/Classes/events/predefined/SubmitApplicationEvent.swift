import Foundation

/**
 * Event SubmitApplicationEvent
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class SubmitApplicationEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.SUBMIT_APPLICATION.eventName
    }
}