//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event StartTutorial
 *
 * @property tutorial the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class StartTutorialEvent : NativeEvent {
    private let tutorial: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(tutorial: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.tutorial = tutorial
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(tutorial: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.tutorial = tutorial.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize StartTutorialEvent to JSONObject
     *
     * @return JSONObject of StartTutorialEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_start_tutorial", tutorial),
            ("affise_event_start_tutorial_timestamp", timeStampMillis)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "StartTutorial" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
