//
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Share
 *
 * @property share the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class ShareEvent : NativeEvent {
    private let share: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(share: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.share = share
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(share: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.share = share.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    /**
     * Serialize ShareEvent to JSONObject
     *
     * @return JSONObject of ShareEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_share", share),
            ("affise_event_share_timestamp", timeStampMillis)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "Share" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
