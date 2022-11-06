//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event LastAttributedTouch
 *
 * @property touchType type in CLICK, WEB_TO_APP_AUTO_REDIRECT, IMPRESSION
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property touchData the JSON Object describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class LastAttributedTouchEvent : NativeEvent {
    private let touchType: TouchType
    private let timeStampMillis: Int64
    private let touchData: [(String, Any?)]
    private let userData: String?
    
    public init(touchType: TouchType,
                timeStampMillis: Int64,
                touchData: [(String, Any?)],
                userData: String? = nil) {
        
        self.touchType = touchType
        self.touchData = touchData
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(touchType: TouchType,
                timeStampMillis: Int64,
                touchData: [[String: AnyObject]],
                userData: String? = nil) {
        
        self.touchType = touchType
        self.touchData = touchData.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize LastAttributedTouchEvent to JSONObject
     *
     * @return JSONObject of LastAttributedTouchEvent
     */
    override func serialize() -> [(String, Any?)] {
        
        var touchType: String
        switch self.touchType {
        case .CLICK:
            touchType = "CLICK"
        case .WEB_TO_APP_AUTO_REDIRECT:
            touchType = "WEB_TO_APP_AUTO_REDIRECT"
        case .IMPRESSION:
            touchType = "IMPRESSION"
        }
        
        return [
            ("affise_event_last_attributed_touch_type", touchType),
            ("affise_event_last_attributed_touch_timestamp", timeStampMillis),
            ("affise_event_last_attributed_touch_data", touchData)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "LastAttributedTouch" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
