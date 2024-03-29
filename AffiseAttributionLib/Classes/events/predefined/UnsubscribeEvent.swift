import Foundation

/**
 * Event Unsubscribe
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class UnsubscribeEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.UNSUBSCRIBE.eventName
    }
}
