/**
 * Event StartTutorial
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class StartTutorialEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.START_TUTORIAL.eventName
    }
}
