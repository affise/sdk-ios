//
//  AchieveLevelEvent.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * When a user has some achieve level event.
 *
 * @property level the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class AchieveLevelEvent : NativeEvent {
    private let level: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    
    public init(level: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.level = level
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(level: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.level = level.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize AchieveLevelEvent to JSONObject
     *
     * @return JSONObject of AchieveLevelEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_achieve_level", level),
            ("affise_event_achieve_level_timestamp", timeStampMillis)
        ]
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "AchieveLevel" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
