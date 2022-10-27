//
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event ViewCart
 *
 * @property objects the JSON Object describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class ViewCartEvent : NativeEvent {
    private let objects: [(String, Any?)]
    private let userData: String?
    
    public init(objects: [(String, Any?)],
                userData: String? = nil) {
        
        self.objects = objects
        self.userData = userData
    }
    
    @objc
    public init(objects: [[String: AnyObject]],
                userData: String? = nil) {
        
        self.objects = objects.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.userData = userData
    }
    
    /**
     * Serialize ViewCartEvent to JSONObject
     *
     * @return JSONObject of ViewCartEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_view_cart", objects)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "ViewCart" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
