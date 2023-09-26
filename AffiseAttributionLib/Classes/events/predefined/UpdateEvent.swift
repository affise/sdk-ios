/**
 * Event Update
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class UpdateEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.UPDATE.eventName
    }
}
