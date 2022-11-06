//
//  DeepLinkedEvent.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event DeepLinked
 *
 * @property isLinked event from link or nor
 * @property userData any custom string data.
 */
@objc
public class DeepLinkedEvent : NativeEvent {
    private let isLinked: Bool
    private let userData: String?
    
    @objc
    public init(isLinked: Bool,
                userData: String? = nil) {
        
        self.isLinked = isLinked
        self.userData = userData
    }

    /**
     * Serialize DeepLinkedEvent to JSONObject
     *
     * @return JSONObject of DeepLinkedEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_deep_linked", isLinked)
        ]
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "DeepLinked" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
