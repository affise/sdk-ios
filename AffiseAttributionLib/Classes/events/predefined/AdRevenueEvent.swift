import Foundation

/**
 * Event AdRevenue
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class AdRevenueEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.AD_REVENUE.eventName
    }
}