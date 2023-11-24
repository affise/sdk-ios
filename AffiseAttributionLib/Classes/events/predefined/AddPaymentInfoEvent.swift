import Foundation

/**
 * Event AddPaymentInfo
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class AddPaymentInfoEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.ADD_PAYMENT_INFO.eventName
    }
}
