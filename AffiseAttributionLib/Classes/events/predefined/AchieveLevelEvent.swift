//
//  AchieveLevelEvent.swift
//  AffiseAttributionLib
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

    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(level: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = level
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(level: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(level: level.toFlatList(), timeStampMillis: timeStampMillis, userData: userData)
    }

    override public func getName() -> String {
        return EventName.ACHIEVE_LEVEL.eventName
    }
}
