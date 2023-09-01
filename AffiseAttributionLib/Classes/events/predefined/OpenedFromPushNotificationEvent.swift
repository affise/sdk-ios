//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event OpenedFromPushNotification
 *
 * @property details the describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class OpenedFromPushNotificationEvent : NativeEvent {
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(details: String,
                userData: String? = nil) {
        self.init(userData)
        self.anyData = details
    }

    override public func getName() -> String {
        return EventName.OPENED_FROM_PUSH_NOTIFICATION.eventName
    }
}
