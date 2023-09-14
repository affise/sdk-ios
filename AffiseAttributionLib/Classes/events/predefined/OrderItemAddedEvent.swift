/**
 * Event OrderItemAdded
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class OrderItemAddedEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.ORDER_ITEM_ADDED.eventName
    }
}