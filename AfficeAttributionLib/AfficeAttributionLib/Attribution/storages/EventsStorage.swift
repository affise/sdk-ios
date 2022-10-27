//
//  EventsStorage.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation

internal protocol EventsStorage {
    func hasEvents(key: String) -> Bool
    func saveEvent(key: String, event: SerializedEvent)
    func getEvents(key: String) -> Array<SerializedEvent>
    func deleteEvent(key: String, ids: Array<String>)
    func clear()
}
