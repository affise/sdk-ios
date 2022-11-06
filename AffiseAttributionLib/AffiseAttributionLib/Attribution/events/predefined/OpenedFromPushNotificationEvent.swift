//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event OpenedFromPushNotification
 *
 * @property details the describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class OpenedFromPushNotificationEvent : NativeEvent {
    private let details: String
    private let userData: String?
    
    @objc
    public init(details: String,
                userData: String? = nil) {
        
        self.details = details
        self.userData = userData
    }

    /**
     * Serialize OpenedFromPushNotification to JSONObject
     *
     * @return JSONObject of OpenedFromPushNotification
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_opened_from_push_notification", details)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "OpenedFromPushNotification" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
