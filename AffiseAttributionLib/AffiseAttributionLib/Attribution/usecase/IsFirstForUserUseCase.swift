import Foundation

/**
 * Event use case for store events
 */
protocol IsFirstForUserUseCase {

    /**
     * Update IsFirstForUser
     */
    func updateEvent(_ event: Event)
}
