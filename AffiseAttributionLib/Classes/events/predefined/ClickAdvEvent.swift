import Foundation

/**
 * Event ClickAdv
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class ClickAdvEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.CLICK_ADV.eventName
    }
}
