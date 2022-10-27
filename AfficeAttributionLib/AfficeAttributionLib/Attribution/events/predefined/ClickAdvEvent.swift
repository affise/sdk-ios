//
//  ClickAdvEvent.swift
//  AfficeAttributionLib
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
    private let advertisement: String
    private let timeStampMillis: Int64
    private let userData: String?
    
    @objc
    public init(advertisement: String,
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.advertisement = advertisement
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize ClickAdvEvent to JSONObject
     *
     * @return JSONObject of ClickAdvEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_click_adv", advertisement),
            ("affise_event_click_adv_timestamp", timeStampMillis)
        ]
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "ClickAdv" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
