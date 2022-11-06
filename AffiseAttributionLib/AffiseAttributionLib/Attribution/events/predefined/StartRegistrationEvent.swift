//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event StartRegistration
 *
 * @property registration the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class StartRegistrationEvent : NativeEvent {
    private let registration: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(registration: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.registration = registration
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(registration: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.registration = registration.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    /**
     * Serialize StartRegistrationEvent to JSONObject
     *
     * @return JSONObject of StartRegistrationEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_start_registration", registration),
            ("affise_event_start_registration_timestamp", timeStampMillis)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "StartRegistration" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
