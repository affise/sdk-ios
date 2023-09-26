
/**
 * Event CompleteStream
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CompleteStreamEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.COMPLETE_STREAM.eventName
    }
}
