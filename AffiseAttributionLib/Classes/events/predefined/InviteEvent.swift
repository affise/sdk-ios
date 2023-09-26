/**
 * Event Invite
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class InviteEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.INVITE.eventName
    }
}
