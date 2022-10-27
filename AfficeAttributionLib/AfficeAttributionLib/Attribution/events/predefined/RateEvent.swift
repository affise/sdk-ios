//
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Rate use
 *
 * @property rate the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class RateEvent : NativeEvent {
    private let rate: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(rate: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.rate = rate
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(rate: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.rate = rate.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    /**
     * Serialize RateEvent to JSONObject
     *
     * @return JSONObject of RateEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_rate", rate),
            ("affise_event_rate_timestamp", timeStampMillis)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "Rate" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
