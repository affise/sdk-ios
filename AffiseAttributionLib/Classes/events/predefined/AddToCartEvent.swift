import Foundation

/**
 * Event AddToCart
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class AddToCartEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.ADD_TO_CART.eventName
    }
}
