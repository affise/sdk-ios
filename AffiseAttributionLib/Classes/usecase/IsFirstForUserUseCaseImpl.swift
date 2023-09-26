/**
 * Event use case for IsFirstForUser
 *
 * @property isFirstForUserStorage storage of already send events
 */
class IsFirstForUserUseCaseImpl {

    private let isFirstForUserStorage: IsFirstForUserStorage
    
    /**
     * Cache of already send events
     */
    private var cache: Array<String> = []

    
    init(isFirstForUserStorage: IsFirstForUserStorage) {
        self.isFirstForUserStorage = isFirstForUserStorage
        cache = isFirstForUserStorage.getEventsNames()
    }
}

extension IsFirstForUserUseCaseImpl: IsFirstForUserUseCase {

    /**
     * Update IsFirstForUser
     */
    func updateEvent(_ event: Event) {
        let eventClass = String(describing: type(of: event))
        if (self.cache.contains(eventClass)) {
            event.setFirstForUser(false)
        } else {
            self.cache.append(eventClass)
            self.isFirstForUserStorage.add(eventClass)
            event.setFirstForUser(true)
        }
    }

    /**
     * Update IsFirstForUser for webBridge
     */
    func updateWebEvent(_ event: String) -> String {
        do {
            var eventClass: String? = nil
            var dict = try JSONSerialization.jsonObject(with: event.data(using: .utf8)!, options: .mutableContainers) as! [String: Any?]
            
            let subtype = (dict[Parameters.AFFISE_EVENT_DATA] as? [String: Any?])?[SubscriptionParameters.AFFISE_SUBSCRIPTION_EVENT_TYPE_KEY.rawValue] as? String
  
            if let subtype = subtype {
                eventClass = subtype
            } else {
                eventClass = dict[Parameters.AFFISE_EVENT_NAME] as? String
            }

            guard let eventClass = eventClass else {
                return event
            }
            
            if (self.cache.contains(eventClass)) {
                dict[Parameters.AFFISE_EVENT_FIRST_FOR_USER] = false
            } else {
                self.cache.append(eventClass)
                self.isFirstForUserStorage.add(eventClass)
                dict[Parameters.AFFISE_EVENT_FIRST_FOR_USER] = true
            }
        
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            return String(data: jsonData, encoding: .utf8)!
        } catch {
            return event
        }
    }
}
