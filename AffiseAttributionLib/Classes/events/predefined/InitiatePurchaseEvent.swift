import Foundation

/**
 * Event InitiatePurchase
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class InitiatePurchaseEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.INITIATE_PURCHASE.eventName
    }
}
