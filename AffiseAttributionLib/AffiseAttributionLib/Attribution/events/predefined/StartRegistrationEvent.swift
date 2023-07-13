//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event StartRegistration
 *
 * @property registration the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class StartRegistrationEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(registration: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = registration
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(registration: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(registration: registration.toFlatList(), timeStampMillis: timeStampMillis, userData: userData)
    }
}
