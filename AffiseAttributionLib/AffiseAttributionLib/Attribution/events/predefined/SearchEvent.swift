//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Search
 *
 * @property search the JSON array describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class SearchEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(search: [Any],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = search
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(search: [AnyObject],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(search: search.toAnyList(), timeStampMillis: timeStampMillis, userData: userData)
    }

    override public func getName() -> String {
        return EventName.SEARCH.eventName
    }
}
