import Foundation

/**
 * When a user has some achieve level event.
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class AchieveLevelEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.ACHIEVE_LEVEL.eventName
    }
}
