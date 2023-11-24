import Foundation

/**
 * Event Subscribe
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class SubscribeEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.SUBSCRIBE.eventName
    }
}
