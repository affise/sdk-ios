import Foundation

/**
 * Event DeepLinked
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class DeepLinkedEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.DEEP_LINKED.eventName
    }
}
