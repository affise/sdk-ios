//
//  AddToCartEvent.swift
//  AfficeAttributionLib
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
    private let addToCartObject: [(String, Any?)]?
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(addToCartObject: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.addToCartObject = addToCartObject
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(addToCartObject: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.addToCartObject = addToCartObject.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize AddToCartEvent to JSONObject
     *
     * @return JSONObject of AddToCartEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_add_to_cart", addToCartObject),
            ("affise_event_add_to_cart_timestamp", timeStampMillis)
        ]
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "AddToCart" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
