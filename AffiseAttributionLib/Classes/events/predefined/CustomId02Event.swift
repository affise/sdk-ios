import Foundation

/**
 * Event CustomId02
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CustomId02Event : NativeEvent {

    override public func getName() -> String {
        return EventName.CUSTOM_ID_02.eventName
    }
}
