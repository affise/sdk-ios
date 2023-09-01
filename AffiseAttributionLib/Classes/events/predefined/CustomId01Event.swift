//
//  CustomId01Event.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Event CustomId01
 *
 * @property custom the describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class CustomId01Event : NativeEvent {
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(custom: String,
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = custom
    }

    override public func getName() -> String {
        return EventName.CUSTOM_ID_01.eventName
    }
}