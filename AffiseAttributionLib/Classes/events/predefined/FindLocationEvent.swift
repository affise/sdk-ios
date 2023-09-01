/**
 * Event FindLocationEvent
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class FindLocationEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.FIND_LOCATION.eventName
    }
}