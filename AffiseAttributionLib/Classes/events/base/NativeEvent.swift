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

    @objc
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
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
