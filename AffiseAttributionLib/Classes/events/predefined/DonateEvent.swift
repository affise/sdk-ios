import Foundation

/**
 * Event DonateEvent
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class DonateEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.DONATE.eventName
    }
}