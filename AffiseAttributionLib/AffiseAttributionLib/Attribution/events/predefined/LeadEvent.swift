/**
 * Event LeadEvent
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class LeadEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.LEAD.eventName
    }
}