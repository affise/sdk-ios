/**
 * Event SpendCredits
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class SpendCreditsEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.SPEND_CREDITS.eventName
    }
}
