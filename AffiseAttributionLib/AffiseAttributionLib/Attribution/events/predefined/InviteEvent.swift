//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Invite
 *
 * @property invite the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class InviteEvent : NativeEvent {
    private let invite: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(invite: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.invite = invite
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(invite: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.invite = invite.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize InviteEvent to JSONObject
     *
     * @return JSONObject of InviteEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_invite", invite),
            ("affise_event_invite_timestamp", timeStampMillis)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "Invite" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
