//
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event ViewItem
 *
 * @property item the JSON Object describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class ViewItemEvent : NativeEvent {
    private let item: [(String, Any?)]
    private let userData: String?
    
    public init(item: [(String, Any?)],
                userData: String? = nil) {
        
        self.item = item
        self.userData = userData
    }
    
    @objc
    public init(item: [[String: AnyObject]],
                userData: String? = nil) {
        
        self.item = item.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.userData = userData
    }
    
    /**
     * Serialize ViewItemEvent to JSONObject
     *
     * @return JSONObject of ViewItemEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_view_item", item)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "ViewItem" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
