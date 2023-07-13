//
//  ContentItemsViewEvent.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event ContentItemsView
 *
 * @property objects the list of JSON Object describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class ContentItemsViewEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(objects: [[(String, Any?)]],
                userData: String? = nil) {
        self.init(userData)
        self.anyData = objects.map { $0.jsonString() }
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(objects: [[String: AnyObject]],
                userData: String? = nil) {  
        self.init(objects: objects.toListOfList(), userData: userData)
    }
}
