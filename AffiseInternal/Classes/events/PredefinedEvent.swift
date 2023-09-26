import AffiseAttributionLib

internal class PredefinedEvent {
    static func create(_ name: String?, map: [String: Any?]) -> Event? {
        guard let eventName: String = name else {
            return nil
        }

        let timeStamp = map.getTimeStamp() ?? timestamp()
        let userData = map.getUserData()

        return UserCustomEvent(eventName: eventName, userData: userData, timeStampMillis: timeStamp)
    }
}
