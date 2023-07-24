//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Rate use
 *
 * @property reEngage the describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class ReEngageEvent : NativeEvent {
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(reEngage: String,
                userData: String? = nil) {
        self.init(userData)
        self.anyData = reEngage
    }

    override public func getName() -> String {
        return EventName.RE_ENGAGE.eventName
    }
}
