//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event ViewItems
 *
 * @property items the JSON array describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class ViewItemsEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(items: [Any],
                userData: String? = nil) {
        self.init(userData)
        self.anyData = items
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(items: [AnyObject],
                userData: String? = nil) {
        self.init(userData)
        self.anyData = items
    }

    override public func getName() -> String {
        return EventName.VIEW_ITEMS.eventName
    }
}
