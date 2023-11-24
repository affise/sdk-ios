import Foundation

/**
 * Event CompleteTrial
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class CompleteTrialEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.COMPLETE_TRIAL.eventName
    }
}
