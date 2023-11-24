import Foundation

/**
 * Event CustomId05
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CustomId05Event : NativeEvent {

    override public func getName() -> String {
        return EventName.CUSTOM_ID_05.eventName
    }
}
