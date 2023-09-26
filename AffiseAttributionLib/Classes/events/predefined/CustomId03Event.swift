
/**
 * Event CustomId03
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CustomId03Event : NativeEvent {

    override public func getName() -> String {
        return EventName.CUSTOM_ID_03.eventName
    }
}
