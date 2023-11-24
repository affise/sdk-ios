import Foundation

/**
 * Event ContentItemsView
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class ContentItemsViewEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.CONTENT_ITEMS_VIEW.eventName
    }
}
