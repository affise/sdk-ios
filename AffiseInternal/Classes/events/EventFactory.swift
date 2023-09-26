import AffiseAttributionLib

internal class AffiseEventFactory {
    func create(_ map: [String: Any?]?) -> Event? {
        guard let eventData: [String: Any?] = map else {
            return nil
        }

        let name = eventData.getEventName()
        let subType = eventData.getSubType()

        var event: Event? = nil
        
        if SubscriptionEvent.isSubscriptionEvent(eventData) {
            event = SubscriptionEvent.create(name, subName: subType, map: eventData)
        } else {
            event = PredefinedEvent.create(name, map: eventData)
        }
        
        guard let event = event else {
            return nil
        }

        if event.getName() != name {
            print("event type mismatch \(event.getName()), expected \(name ?? "UNKNOWN")")
        }

        var result = event
        EventParameters.addParameters(&result, map: eventData.getEventParameters())

        return result
    }
}
