/**
 * Event OpenedFromPushNotification
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class OpenedFromPushNotificationEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.OPENED_FROM_PUSH_NOTIFICATION.eventName
    }
}
