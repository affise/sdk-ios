import Foundation

/**
 * Event InitiateStream
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class InitiateStreamEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.INITIATE_STREAM.eventName
    }
}
