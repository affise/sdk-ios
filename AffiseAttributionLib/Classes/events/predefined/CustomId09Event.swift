import Foundation

/**
 * Event CustomId09
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CustomId09Event : NativeEvent {

    override public func getName() -> String {
        return EventName.CUSTOM_ID_09.eventName
    }
}
