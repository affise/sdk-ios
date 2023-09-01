import Foundation

/**
 * Event use case for store InternalEvent
 */
protocol StoreInternalEventUseCase {

    /**
     * Store InternalEvent
     */
    func storeInternalEvent(event: InternalEvent)
}
