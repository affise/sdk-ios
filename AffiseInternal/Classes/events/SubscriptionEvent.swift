import AffiseAttributionLib

internal class SubscriptionEvent {
    static func isSubscriptionEvent(_ map: [String: Any?]) -> Bool {
        return map.getSubType() != nil
    }

    static func create(_ eventName: String?, subName: String?, map: [String: Any?]) -> Event? {
        guard let type: String = eventName else { return nil }
        guard let subType: String = subName else {
            return nil
        }
        
        let userData = map.getUserData()
        var dataMap = map.getEventData()
        let data = dataMap.removeSubtypeFields(type).toArray()
        let category = map.getCategory()

        return UserCustomSubscriptionEvent(
            type: type, 
            subtype: subType,
            data: data, 
            userData: userData,
            category: category
        )
    }
}
