//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Subscribe
 *
 * @property subscribe the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class SubscribeEvent : NativeEvent {
    private let subscribe: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(subscribe: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.subscribe = subscribe
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(subscribe: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.subscribe = subscribe.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize SubscribeEvent to JSONObject
     *
     * @return JSONObject of SubscribeEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_subscribe", subscribe),
            ("affise_event_subscribe_timestamp", timeStampMillis)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "Subscribe" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
