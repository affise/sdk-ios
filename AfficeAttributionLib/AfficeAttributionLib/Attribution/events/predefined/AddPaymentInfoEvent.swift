//
//  AddPaymentInfoEvent.swift
//  AfficeAttributionLib
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
    private let paymentInfo: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    
    public init(paymentInfo: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.paymentInfo = paymentInfo
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(paymentInfo: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.paymentInfo = paymentInfo.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    /**
     * Serialize AddPaymentInfoEvent to JSONObject
     *
     * @return JSONObject of AddPaymentInfoEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_add_payment_info", paymentInfo),
            ("affise_event_add_payment_info_timestamp", timeStampMillis)
        ]
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "AddPaymentInfo" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
