//
//  EventsRepository.swift
//  app
//
//  Created by Sergey Korney
//


/**
 * Events repository interface
 */
internal protocol EventsRepository {

    /**
     * Has save events by [url] or not
     */
    func hasEvents(url: String) -> Bool

    /**
     * Event recording for each url
     */
    func storeEvent(event: Event, urls: Array<String>)

    /**
     * Web Event recording for each url
     */
    func storeWebEvent(event: String, urls: Array<String>)

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
