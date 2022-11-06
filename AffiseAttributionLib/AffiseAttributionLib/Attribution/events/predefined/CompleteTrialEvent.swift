//
//  CompleteTrialEvent.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event CompleteTrial
 *
 * @property trial the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class CompleteTrialEvent : NativeEvent {
    private let trial: [(String, Any?)]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(trial: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.trial = trial
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(trial: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.trial = trial.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }

    /**
     * Serialize CompleteTrialEvent to JSONObject
     *
     * @return JSONObject of CompleteTrialEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_complete_trial", trial),
            ("affise_event_complete_trial_timestamp", timeStampMillis)
        ]
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "CompleteTrial" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
