//
//  EventsRepositoryImpl.swift
//  app
//
//  Created by Sergey Korney
//


/**
 * Events repository provide write, read and delete events.
 *
 * @property converterToBase64 convert string to encoding Base64 string
 * @property converterToSerializedEvent to convert Event to SerializedEvent
 * @property logsManager for error logging
 * @property eventsStorage storage of events
 */
internal class EventsRepositoryImpl {
    
    private let converterToBase64: ConverterToBase64
    private let converterToSerializedEvent: EventToSerializedEventConverter
    private let logsManager: LogsManager
    private let eventsStorage: EventsStorage
    
    init(converterToBase64: ConverterToBase64,
         converterToSerializedEvent: EventToSerializedEventConverter,
         logsManager: LogsManager,
         eventsStorage: EventsStorage) {
        
        self.converterToBase64 = converterToBase64
        self.converterToSerializedEvent = converterToSerializedEvent
        self.logsManager = logsManager
        self.eventsStorage = eventsStorage
    }
}


extension EventsRepositoryImpl : EventsRepository {
    
    /**
     * Has save events by [url] or not
     */
    func hasEvents(url: String) -> Bool {
        return eventsStorage.hasEvents(key: converterToBase64.convert(from: url))
    }
    
    /**
     * Store [event] by [urls]
     */
    func storeEvent(event: Event, urls: Array<String>) {
        //For al urls
        urls.forEach { it in
            //Save event
            eventsStorage.saveEvent(
                key: converterToBase64.convert(from: it),
                event: converterToSerializedEvent.convert(from: event)
            )
        }
    }
    
    /**
     * Store web[event] by [urls]
     */
    func storeWebEvent(event: String, urls: Array<String>) {
        do {
            //Create json
            let dict = try JSONSerialization.jsonObject(with: event.data(using: .utf8)!, options: .mutableContainers) as! Dictionary<String, Any?>
            
            //Gei event id
            let id = dict[Parameters.AFFISE_EVENT_ID] as! String
            
            //Crreate serialized event
            let serializedEvent = SerializedEvent(id: id, data: event)
            
            //For al urls
            urls.forEach { it in
                //Save event
                eventsStorage.saveEvent(
                    key: converterToBase64.convert(from: it),
                    event: serializedEvent
                )
            }
        } catch  {
            //Log error
            logsManager.addUserError(error: error)
        }
    }
    
    /**
     * Get serialized events by [url]
     *
     * @return list of serialized events
     */
    func getEvents(url: String) -> Array<SerializedEvent> {
        return eventsStorage.getEvents(key: converterToBase64.convert(from: url))
    }
    
    /**
     * Delete event for [url] by [ids]
     */
    func deleteEvent(ids: Array<String>, url: String) {
        eventsStorage.deleteEvent(
            key: converterToBase64.convert(from: url),
            ids: ids
        )
    }
    
    /**
     * Removes all events
     */
    func clear() {
        eventsStorage.clear()
    }
}
