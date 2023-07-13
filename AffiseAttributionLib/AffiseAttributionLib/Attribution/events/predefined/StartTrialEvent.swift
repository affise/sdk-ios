//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event StartTrial
 *
 * @property trial the JSON Object describing the meaning of the event.
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property userData any custom string data.
 */
@objc
public class StartTrialEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(trial: [(String, Any?)],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)
        self.anyData = trial
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(trial: [[String: AnyObject]],
                timeStampMillis: Int64,
                userData: String? = nil) {
        self.init(trial: trial.toFlatList(), timeStampMillis: timeStampMillis, userData: userData)
    }
}
