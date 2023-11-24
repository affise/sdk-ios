import Foundation

/**
 * Event LastAttributedTouch
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class LastAttributedTouchEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.LAST_ATTRIBUTED_TOUCH.eventName
    }
}
