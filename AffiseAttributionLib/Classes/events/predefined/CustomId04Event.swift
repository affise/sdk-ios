
/**
 * Event CustomId04
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CustomId04Event : NativeEvent {

    override public func getName() -> String {
        return EventName.CUSTOM_ID_04.eventName
    }
}
