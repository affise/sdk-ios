//
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event LastAttributedTouch
 *
 * @property touchType type in CLICK, WEB_TO_APP_AUTO_REDIRECT, IMPRESSION
 * @property timeStampMillis the timestamp event in milliseconds.
 * @property touchData the JSON Object describing the meaning of the event.
 * @property userData any custom string data.
 */
@objc
public class LastAttributedTouchEvent : NativeEvent {
    private var touchType: TouchType? = nil
    private var touchData: [(String, Any?)] = []

    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    public convenience init(touchType: TouchType,
                timeStampMillis: Int64,
                touchData: [(String, Any?)],
                userData: String? = nil) {
        self.init(userData, timeStampMillis: timeStampMillis)

        self.touchType = touchType
        self.touchData = touchData
    }
    
    @available(*, deprecated, message: "use init(_ userData:timeStampMillis:)")
    @objc
    public convenience init(touchType: TouchType,
                timeStampMillis: Int64,
                touchData: [[String: AnyObject]],
                userData: String? = nil) { 
        self.init(touchType: touchType, timeStampMillis: timeStampMillis, touchData: touchData.toFlatList(), userData: userData)
    }

    override func serializeBuilder() -> AffisePropertyBuilder {
        return super.serializeBuilder()
            .add("type", value: touchType?.rawValue)
            .add("data", value: touchData)
    }
}
