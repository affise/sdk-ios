//
//  NativeEvent.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation

@objc
public class NativeEvent : Event {
    
    private let userData: String?
    private let timeStampMillis: Int64
    var anyData: Any? = nil

    public init(
        _ userData: String? = nil,
        timeStampMillis: Int64 = timestamp()
    ) {
        self.userData = userData
        self.timeStampMillis = timeStampMillis
    }
    
    override func getCategory() -> String {
        "native"
    }
    
    func serializeBuilder() -> AffisePropertyBuilder {
        return AffisePropertyBuilder()
            .new(getName(), value: anyData)
            .add(AffiseProperty.TIMESTAMP, value: timeStampMillis)
    }
    
    /**
     * Serialize AchieveLevelEvent to JSONObject
     *
     * @return JSONObject of AchieveLevelEvent
     */
    override func serialize() -> [(String, Any?)] {
        return serializeBuilder().build()
    }


    /**
     * Name of event
     *
     * @return name
     */
    override public func getName() -> String {
        return toEventName(self)
    }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
