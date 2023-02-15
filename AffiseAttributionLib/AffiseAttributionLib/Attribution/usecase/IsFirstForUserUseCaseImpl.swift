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
}
