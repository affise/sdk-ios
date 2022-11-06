//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event ViewAdv
 *
 * @property ad the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class ViewAdvEvent : NativeEvent {
    private let ad: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(ad: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.ad = ad
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(ad: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.ad = ad.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    /**
     * Serialize ViewAdvEvent to JSONObject
     *
     * @return JSONObject of ViewAdvEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_view_adv", ad),
            ("affise_event_view_adv_timestamp", timeStampMillis)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "ViewAdv" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
