//
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event ViewItems
 *
 * @property items the JSON array describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class ViewItemsEvent : NativeEvent {
    private let items: [Any]
    private let userData: String?
    
    public init(items: [Any],
                userData: String? = nil) {
        
        self.items = items
        self.userData = userData
    }
    
    @objc
    public init(items: [AnyObject],
                userData: String? = nil) {
        
        self.items = items
        self.userData = userData
    }

    /**
     * Serialize ViewItemsEvent to JSONObject
     *
     * @return JSONObject of ViewItemsEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_view_items", items)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "ViewItems" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
