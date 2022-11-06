//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event UnlockAchievement
 *
 * @property achievement the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class UnlockAchievementEvent : NativeEvent {
    private let achievement: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(achievement: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.achievement = achievement
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(achievement: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.achievement = achievement.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize UnlockAchievementEvent to JSONObject
     *
     * @return JSONObject of UnlockAchievementEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_unlock_achievement", achievement),
            ("affise_event_unlock_achievement_timestamp", timeStampMillis)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "UnlockAchievement" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
