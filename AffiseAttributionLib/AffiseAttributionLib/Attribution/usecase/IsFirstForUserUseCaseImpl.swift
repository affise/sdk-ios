import Foundation

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
            var eventClass = ""
            var dict = try JSONSerialization.jsonObject(with: event.data(using: .utf8)!, options: .mutableContainers) as! [String: Any?]
            let eventType = classOfEvent(dict)
            if let ti = eventType {
                eventClass = String(describing: ti)
            } else {
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
