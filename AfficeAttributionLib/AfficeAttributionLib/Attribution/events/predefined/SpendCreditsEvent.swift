//
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event SpendCredits
 *
 * @property credits the value of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class SpendCreditsEvent : NativeEvent {
    private let credits: Int64
    private let timeStampMillis: Int64
    private let userData: String?
    
    @objc
    public init(credits: Int64,
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.credits = credits
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize SpendCreditsEvent to JSONObject
     *
     * @return JSONObject of SpendCreditsEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_spend_credits", credits),
            ("affise_event_spend_credits_timestamp", timeStampMillis)
        ]
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "SpendCredits" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
