//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Invite
 *
 * @property invite the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class InviteEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(invite: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = invite
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(invite: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(invite: invite.toFlatList(), timeStampMillis: timeStampMillis, userData: userData)
    }
}
