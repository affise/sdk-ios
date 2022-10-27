//
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event ListView
 *
 * @property list the JSON Object describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class ListViewEvent : NativeEvent {
    private let list: [(String, Any?)]
    private let userData: String?
    
    public init(list: [(String, Any?)],
                userData: String? = nil) {
        
        self.list = list
        self.userData = userData
    }
    
    @objc
    public init(list: [[String: AnyObject]],
                userData: String? = nil) {
        
        self.list = list.flatMap { dict in
            return dict.map { (key, value) in
                return (key, value as Any)
            }
        }
        self.userData = userData
    }

    /**
     * Serialize ListViewEvent to JSONObject
     *
     * @return JSONObject of ListViewEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_list_view", list)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "ListView" }

    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
