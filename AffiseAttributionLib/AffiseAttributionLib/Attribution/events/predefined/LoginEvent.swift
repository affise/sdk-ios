//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Login
 *
 * @property login the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class LoginEvent : NativeEvent {
    private let login: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(login: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.login = login
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(login: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.login = login.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize LoginEvent to JSONObject
     *
     * @return JSONObject of LoginEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_login", login),
            ("affise_event_login_timestamp", timeStampMillis)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "Login" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
