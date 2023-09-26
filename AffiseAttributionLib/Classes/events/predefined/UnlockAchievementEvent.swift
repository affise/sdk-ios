/**
 * Event UnlockAchievement
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class UnlockAchievementEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.UNLOCK_ACHIEVEMENT.eventName
    }
}
