/**
 * Internal Events repository interface
 */
internal protocol InternalEventsRepository {

    /**
     * Has save events by [url] or not
     */
    func hasEvents(url: String) -> Bool

    /**
     * Event recording for each url
     */
    func storeEvent(event: InternalEvent, urls: Array<String>)

    /**
     * Get event in dir
     */
    func getEvents(url: String) -> Array<SerializedEvent>

    /**
     * Delete events in dir
     */
    func deleteEvent(ids: Array<String>, url: String)

    /**
     * Removes all events
     */
    func clear()
}
