import Foundation

/**
 * Event ViewContentEvent
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class ViewContentEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.VIEW_CONTENT.eventName
    }
}