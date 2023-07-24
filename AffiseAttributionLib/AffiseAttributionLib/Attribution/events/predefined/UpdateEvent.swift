//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Update
 *
 * @property details the JSON array describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class UpdateEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(details: [Any],
                userData: String? = nil) {
        self.init(userData)
        self.anyData = details
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(details: [AnyObject],
                userData: String? = nil) {
        self.init(details: details.toAnyList(), userData: userData)
    }

    override public func getName() -> String {
        return EventName.UPDATE.eventName
    }
}
