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
    private let objects: [[(String, Any?)]]
    private let userData: String?
    
    public init(objects: [[(String, Any?)]],
                userData: String? = nil) {
        
        self.objects = objects
        self.userData = userData
    }
    
    @objc
    public init(objects: [[String: AnyObject]],
                userData: String? = nil) {
        
        self.objects = objects.map { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.userData = userData
    }

    /**
     * Serialize ContentItemsViewEvent to JSONObject
     *
     * @return JSONObject of ContentItemsViewEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_content_items_view", objects.map { $0.jsonString() } )
        ]
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "ContentItemsView" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
