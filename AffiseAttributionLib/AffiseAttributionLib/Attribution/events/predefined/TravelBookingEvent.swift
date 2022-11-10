//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event TravelBooking
 *
 * @property details the JSON array describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class TravelBookingEvent : NativeEvent {
    private let details: [Any]
    private let userData: String?
    
    public init(details: [Any],
                userData: String? = nil) {
        
        self.details = details
        self.userData = userData
    }
    
    @objc
    public init(details: [AnyObject],
                userData: String? = nil) {
        
        self.details = details
        self.userData = userData
    }

    /**
     * Serialize TravelBookingEvent to JSONObject
     *
     * @return JSONObject of TravelBookingEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_travel_booking", details)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "TravelBooking" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
