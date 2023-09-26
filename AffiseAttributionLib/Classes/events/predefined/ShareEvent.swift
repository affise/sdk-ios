/**
 * Event Share
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class ShareEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.SHARE.eventName
    }
}
