import Foundation

/**
 * Event CustomId10
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CustomId10Event : NativeEvent {

    override public func getName() -> String {
        return EventName.CUSTOM_ID_10.eventName
    }
}
