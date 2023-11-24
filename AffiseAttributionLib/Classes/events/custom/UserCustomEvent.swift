import Foundation

/**
 * Event UserCustom
 *
 * @property eventName custom event name.
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class UserCustomEvent : NativeEvent {

    private var eventName: String = ""

    @objc
    public init(
        eventName: String,
        userData: String? = nil,
        timeStampMillis: Int64 = timestamp()
    ) {
        super.init(userData, timeStampMillis: timeStampMillis)
        self.eventName = eventName
    }

    override public func getName() -> String {
        return eventName
    }
}
