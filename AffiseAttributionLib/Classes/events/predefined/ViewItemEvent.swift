/**
 * Event ViewItem
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class ViewItemEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.VIEW_ITEM.eventName
    }
}
