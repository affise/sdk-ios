//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event ViewCart
 *
 * @property objects the JSON Object describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class ViewCartEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(objects: [(String, Any?)],
                userData: String? = nil) {
        self.init(userData)
        self.anyData = objects
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(objects: [[String: AnyObject]],
                userData: String? = nil) {
        self.init(objects: objects.toFlatList(), userData: userData)
    }
}
