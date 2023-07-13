//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Purchase use
 *
 * @property purchaseData the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class PurchaseEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(purchaseData: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = purchaseData
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(purchaseData: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(purchaseData: purchaseData.toFlatList(), timeStampMillis: timeStampMillis, userData: userData)
    }
}
