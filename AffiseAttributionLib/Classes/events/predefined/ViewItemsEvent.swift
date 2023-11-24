import Foundation

/**
 * Event ViewItems
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class ViewItemsEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.VIEW_ITEMS.eventName
    }
}
