//
//  AddPaymentInfoEvent.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event AddPaymentInfo
 *
 * @property paymentInfo the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class AddPaymentInfoEvent : NativeEvent {
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")   
    public convenience init(paymentInfo: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = paymentInfo
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(paymentInfo: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(paymentInfo: paymentInfo.toFlatList(), timeStampMillis: timeStampMillis, userData: userData)
    }

    override public func getName() -> String {
        return EventName.ADD_PAYMENT_INFO.eventName
    }
}
