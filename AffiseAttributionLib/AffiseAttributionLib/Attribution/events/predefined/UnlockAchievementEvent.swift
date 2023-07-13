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
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(achievement: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = achievement
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(achievement: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(achievement: achievement.toFlatList(), timeStampMillis: timeStampMillis, userData: userData)
    }
}
