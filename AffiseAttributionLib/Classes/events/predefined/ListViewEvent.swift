import Foundation

/**
 * Event ListView
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class ListViewEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.LIST_VIEW.eventName
    }
}
