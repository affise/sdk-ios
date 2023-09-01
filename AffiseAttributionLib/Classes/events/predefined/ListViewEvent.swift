//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event ListView
 *
 * @property list the JSON Object describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class ListViewEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(list: [(String, Any?)],
                userData: String? = nil) {
        self.init(userData)
        self.anyData = list
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(list: [[String: AnyObject]],
                userData: String? = nil) {
        self.init(list: list.toFlatList(), userData: userData)
    }

    override public func getName() -> String {
        return EventName.LIST_VIEW.eventName
    }
}
