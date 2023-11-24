import Foundation

/**
 * Event Reserve
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class ReserveEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.RESERVE.eventName
    }
}
