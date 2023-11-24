import Foundation

/**
 * Event ViewAdv
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class ViewAdvEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.VIEW_ADV.eventName
    }
}
