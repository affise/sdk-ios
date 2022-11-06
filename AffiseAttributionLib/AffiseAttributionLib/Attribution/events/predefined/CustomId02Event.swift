//
//  CustomId02Event.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event CustomId02
 *
 * @property custom the describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class CustomId02Event : NativeEvent {
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
     * Serialize CustomId02Event to JSONObject
     *
     * @return JSONObject of CustomId02Event
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_custom_id_05", custom),
            ("affise_event_custom_id_05_timestamp", timeStampMillis)
        ]
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "CustomId02" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
