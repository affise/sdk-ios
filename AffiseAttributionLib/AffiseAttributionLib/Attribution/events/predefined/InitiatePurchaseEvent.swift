//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event InitiatePurchase
 *
 * @property purchaseData the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class InitiatePurchaseEvent : NativeEvent {
    private let purchaseData: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(purchaseData: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.purchaseData = purchaseData
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(purchaseData: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.purchaseData = purchaseData.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize InitiatePurchaseEvent to JSONObject
     *
     * @return JSONObject of InitiatePurchaseEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_initiate_purchase", purchaseData),
            ("affise_event_initiate_purchase_timestamp", timeStampMillis)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "InitiatePurchase" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
