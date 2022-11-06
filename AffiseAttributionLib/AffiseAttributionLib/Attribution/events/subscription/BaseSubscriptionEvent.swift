//
//  BaseSubscriptionEvent.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Base Event of Subscription use [data] of event and [userData]
 */
@objc
public class BaseSubscriptionEvent : NativeEvent {
    private let data: [(String, Any?)]
    private let userData: String?
    
    
    public init(data: [(String, Any?)],
                userData: String? = nil) {
        
        self.data = data
        self.userData = userData
    }
    
    @objc
    public init(data: [[String: AnyObject]],
                userData: String? = nil) {
        
        self.data = data.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.userData = userData
    }

    /**
     * Type of subscription
     *
     */
    func type() -> String { return "" }

    /**
     * Subtype of subscription
     */
    public func subtype() -> String { return "" }

    /**
     * Serialize SubscriptionEvent to JSONObject
     *
     * @return JSONObject of SubscriptionEvent
     */
    override func serialize() -> [(String, Any?)] {
        
        //Add subtype
        var dict: [(String, Any?)] = [
            (SubscriptionParameters.AFFISE_SUBSCRIPTION_EVENT_TYPE_KEY.rawValue, subtype())
        ]
        
        //Add data
        dict.append(contentsOf: data)
        
        return dict
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return type() }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
