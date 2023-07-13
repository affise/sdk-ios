//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event SpendCredits
 *
 * @property credits the value of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class SpendCreditsEvent : NativeEvent {
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(credits: Int64,
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = credits
    }
}
