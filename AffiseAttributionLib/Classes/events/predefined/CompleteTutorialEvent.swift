
/**
 * Event CompleteTutorial
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CompleteTutorialEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.COMPLETE_TUTORIAL.eventName
    }
}
