//
//  CompleteTutorialEvent.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event CompleteTutorial
 *
 * @property tutorial the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class CompleteTutorialEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(tutorial: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = tutorial
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(tutorial: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(tutorial: tutorial.toFlatList(), timeStampMillis: timeStampMillis, userData: userData)
    }

    override public func getName() -> String {
        return EventName.COMPLETE_TUTORIAL.eventName
    }
}
