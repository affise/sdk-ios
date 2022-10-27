//
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event GDPR
 *
 * @property userData any custom string data.
 */
@objc
public class GDPREvent : NativeEvent {
    
    public static let EVENT_NAME = "GDPR"
    
    private let userData: String?
    
    @objc
    public init(userData: String? = nil) {
        self.userData = userData
    }

    /**
     * Serialize DeepLinkedEvent to JSONObject
     *
     * @return JSONObject of DeepLinkedEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_gpdr", true)
            ]
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return GDPREvent.EVENT_NAME }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
