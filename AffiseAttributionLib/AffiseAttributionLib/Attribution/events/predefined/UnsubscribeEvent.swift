//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Unsubscribe
 *
 * @property unsubscribe the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class UnsubscribeEvent : NativeEvent {
    private let unsubscribe: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(unsubscribe: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.unsubscribe = unsubscribe
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(unsubscribe: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.unsubscribe = unsubscribe.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    /**
     * Serialize UnsubscribeEvent to JSONObject
     *
     * @return JSONObject of UnsubscribeEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_unsubscribe", unsubscribe),
            ("affise_event_unsubscribe_timestamp", timeStampMillis)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "Unsubscribe" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
