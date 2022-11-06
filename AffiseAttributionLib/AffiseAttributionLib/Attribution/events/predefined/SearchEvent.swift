//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event Search
 *
 * @property search the JSON array describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class SearchEvent : NativeEvent {
    private let search: [Any]
    private let timeStampMillis: Int64
    private let userData: String?
    
    public init(search: [Any],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.search = search
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    @objc
    public init(search: [AnyObject],
                timeStampMillis: Int64,
                userData: String? = nil) {
        
        self.search = search
        self.timeStampMillis = timeStampMillis
        self.userData = userData
    }
    
    /**
     * Serialize SearchEvent to JSONObject
     *
     * @return JSONObject of SearchEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            ("affise_event_search", search),
            ("affise_event_search_timestamp", timeStampMillis)
        ]
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "Search" }
    
    /**
     * User data
     *
     * @return userData
     */
    override func getUserData() -> String? { return userData }
}
