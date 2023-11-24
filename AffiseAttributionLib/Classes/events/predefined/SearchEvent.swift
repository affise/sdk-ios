import Foundation

/**
 * Event Search
 *
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
public class SearchEvent : NativeEvent {

    override public func getName() -> String {
        return EventName.SEARCH.eventName
    }
}
