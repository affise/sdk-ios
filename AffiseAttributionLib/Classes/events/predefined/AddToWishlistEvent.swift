import Foundation

/**
 * Event AddToWishlist
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class AddToWishlistEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.ADD_TO_WISHLIST.eventName
    }
}
