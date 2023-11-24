import Foundation

/**
 * Event TravelBooking
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class TravelBookingEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.TRAVEL_BOOKING.eventName
    }
}
