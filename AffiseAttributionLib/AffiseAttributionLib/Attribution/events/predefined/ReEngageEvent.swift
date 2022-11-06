//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Rate use
 *
 * @property reEngage the describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class ReEngageEvent : NativeEvent {
    private let reEngage: String
    private let userData: String?
    
    @objc
    public init(reEngage: String,
                userData: String? = nil) {
        
        self.reEngage = reEngage
        self.userData = userData
    }
    
    /**
     * Serialize ReEngageEvent to JSONObject
     *
     * @return JSONObject of ReEngageEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_re_engage", reEngage)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "ReEngage" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
