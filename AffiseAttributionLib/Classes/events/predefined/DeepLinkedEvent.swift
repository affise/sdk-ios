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
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(isLinked: Bool,
                userData: String? = nil) {
        self.init(userData)
        self.anyData = isLinked
    }

    override public func getName() -> String {
        return EventName.DEEP_LINKED.eventName
    }
}
