
/**
 * Event CustomId07
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CustomId07Event : NativeEvent {

    override public func getName() -> String {
        return EventName.CUSTOM_ID_07.eventName
    }
}
