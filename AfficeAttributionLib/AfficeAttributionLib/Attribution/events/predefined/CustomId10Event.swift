//
//  CustomId10Event.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event CustomId10
 *
 * @property custom the describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class CustomId10Event : NativeEvent {
    private let custom: String
    private let timeStampMillis: Int64
    private let userData: String?
    
    @objc
    public init(custom: String,
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.custom = custom
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize CustomId10Event to JSONObject
     *
     * @return JSONObject of CustomId10Event
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_custom_id_10", custom),
            ("affise_event_custom_id_10_timestamp", timeStampMillis)
        ]
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "CustomId10" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
