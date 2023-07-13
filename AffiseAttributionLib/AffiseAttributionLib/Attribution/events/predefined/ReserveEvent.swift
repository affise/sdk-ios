//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Reserve
 *
 * @property reserve the list of JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class ReserveEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(reserve: [[(String, Any?)]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = reserve.map { $0.jsonString() }
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(reserve: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(reserve: reserve.toListOfList(), timeStampMillis: timeStampMillis, userData: userData)
    }
}
