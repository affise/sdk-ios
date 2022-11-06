//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Reserve
 *
 * @property reserve the list of JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class ReserveEvent : NativeEvent {
    private let reserve: [[(String, Any?)]]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(reserve: [[(String, Any?)]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.reserve = reserve
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(reserve: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.reserve = reserve.map { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    /**
     * Serialize ReserveEvent to JSONObject
     *
     * @return JSONObject of ReserveEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_reserve", reserve.map { $0.jsonString() }),
            ("affise_event_reserve_timestamp", timeStampMillis)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "Reserve" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
