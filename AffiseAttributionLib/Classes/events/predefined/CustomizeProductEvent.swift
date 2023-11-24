import Foundation

/**
 * Event CustomizeProductEvent
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CustomizeProductEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.CUSTOMIZE_PRODUCT.eventName
    }
}