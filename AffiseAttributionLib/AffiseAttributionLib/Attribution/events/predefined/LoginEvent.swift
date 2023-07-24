//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Login
 *
 * @property login the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class LoginEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(login: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = login
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(login: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(login: login.toFlatList(), timeStampMillis: timeStampMillis, userData: userData)
    }

    override public func getName() -> String {
        return EventName.LOGIN.eventName
    }
}
