import Foundation

/**
 * Event Sales
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class SalesEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.SALES.eventName
    }
}
