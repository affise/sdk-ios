import Foundation

/**
 * Event CustomId06
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CustomId06Event : NativeEvent {

    override public func getName() -> String {
        return EventName.CUSTOM_ID_06.eventName
    }
}
