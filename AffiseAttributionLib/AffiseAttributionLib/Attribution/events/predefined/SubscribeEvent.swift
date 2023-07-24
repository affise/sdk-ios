//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Subscribe
 *
 * @property subscribe the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class SubscribeEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(subscribe: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = subscribe
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(subscribe: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(subscribe: subscribe.toFlatList(), timeStampMillis: timeStampMillis, userData: userData)
    }

    override public func getName() -> String {
        return EventName.SUBSCRIBE.eventName
    }
}
