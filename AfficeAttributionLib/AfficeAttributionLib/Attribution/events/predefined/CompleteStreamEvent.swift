//
//  CompleteStreamEvent.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event CompleteStream
 *
 * @property stream the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class CompleteStreamEvent : NativeEvent {
    private let stream: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(stream: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.stream = stream
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(stream: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.stream = stream.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize CompleteStreamEvent to JSONObject
     *
     * @return JSONObject of CompleteStreamEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_complete_stream", stream),
            ("affise_event_complete_stream_timestamp", timeStampMillis)
        ]
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "CompleteStream" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
