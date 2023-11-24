import Foundation

/**
 * Event ScheduleEvent
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class ScheduleEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.SCHEDULE.eventName
    }
}