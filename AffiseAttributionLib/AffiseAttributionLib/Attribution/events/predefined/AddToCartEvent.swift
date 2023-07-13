//
//  AddToCartEvent.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event AddToCart
 *
 * @property addToCartObject the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class AddToCartEvent : NativeEvent {
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")   
    public convenience init(addToCartObject: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = addToCartObject
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(addToCartObject: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(addToCartObject: addToCartObject.toFlatList(), timeStampMillis: timeStampMillis, userData: userData)
    }
}
