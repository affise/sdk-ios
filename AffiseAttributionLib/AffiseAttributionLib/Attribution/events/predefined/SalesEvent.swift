//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Sales
 *
 * @property salesData the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class SalesEvent : NativeEvent {
    private let salesData: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(salesData: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.salesData = salesData
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(salesData: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.salesData = salesData.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    /**
     * Serialize SalesEvent to JSONObject
     *
     * @return JSONObject of SalesEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_sales", salesData),
            ("affise_event_sales_timestamp", timeStampMillis)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "Sales" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
