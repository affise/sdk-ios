
/**
 * Event CustomId08
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CustomId08Event : NativeEvent {

    override public func getName() -> String {
        return EventName.CUSTOM_ID_08.eventName
    }
}
