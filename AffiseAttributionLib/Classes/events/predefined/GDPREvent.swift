//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event GDPR
 *
 * @property userData any custom string data.
 */
@objc
public class GDPREvent : NativeEvent {
    
    public static let EVENT_NAME = "GDPR"
        
    @objc
    public convenience init(userData: String? = nil) {
        self.init(userData)
        self.anyData = true
    } 
    
    public override func getName() -> String { return GDPREvent.EVENT_NAME }
}
