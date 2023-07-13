//
//  ClickAdvEvent.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event ClickAdv
 *
 * @property advertisement the describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class ClickAdvEvent : NativeEvent {
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(advertisement: String,
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = advertisement
    }
}
