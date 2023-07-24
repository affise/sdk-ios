//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event ViewItem
 *
 * @property item the JSON Object describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class ViewItemEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(item: [(String, Any?)],
                userData: String? = nil) {
        self.init(userData)
        self.anyData = item
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(item: [[String: AnyObject]],
                userData: String? = nil) {
        self.init(userData)
        self.anyData = item.toFlatList()
    }

    override public func getName() -> String {
        return EventName.VIEW_ITEM.eventName
    }
}
