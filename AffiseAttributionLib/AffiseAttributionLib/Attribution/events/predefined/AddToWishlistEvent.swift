//
//  AddToWishlistEvent.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event AddToWishlist
 *
 * @property wishList the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class AddToWishlistEvent : NativeEvent {
    private let wishList: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(wishList: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.wishList = wishList
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(wishList: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.wishList = wishList.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize AddToWishlistEvent to JSONObject
     *
     * @return JSONObject of AddToWishlistEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_add_to_wishlist", wishList),
            ("affise_event_add_to_wishlist_timestamp", timeStampMillis)
        ]
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "AddToWishlist" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
