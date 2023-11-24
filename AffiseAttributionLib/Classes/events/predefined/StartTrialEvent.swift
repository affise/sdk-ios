import Foundation

/**
 * Event StartTrial
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class StartTrialEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.START_TRIAL.eventName
    }
}
