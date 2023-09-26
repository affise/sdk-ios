/**
 * Events repository provide write, read and delete events.
 *
 * @property converterToBase64 convert string to encoding Base64 string
 * @property converterToSerializedEvent to convert Event to SerializedEvent
 * @property logsManager for error logging
 * @property eventsStorage storage of events
 */
internal class InternalEventsRepositoryImpl {
    
    private let converterToBase64: ConverterToBase64
    private let converterToSerializedEvent: InternalEventToSerializedEventConverter
    private let logsManager: LogsManager
    private let eventsStorage: InternalEventsStorage
    
    init(converterToBase64: ConverterToBase64,
         converterToSerializedEvent: InternalEventToSerializedEventConverter,
         logsManager: LogsManager,
         eventsStorage: InternalEventsStorage) {
        
        self.converterToBase64 = converterToBase64
        self.converterToSerializedEvent = converterToSerializedEvent
        self.logsManager = logsManager
        self.eventsStorage = eventsStorage
    }
}


extension InternalEventsRepositoryImpl : InternalEventsRepository {
    
    /**
     * Has save events by [url] or not
     */
    func hasEvents(url: String) -> Bool {
        return eventsStorage.hasEvents(key: converterToBase64.convert(from: url))
    }
    
    /**
     * Store [event] by [urls]
     */
    func storeEvent(event: InternalEvent, urls: Array<String>) {
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
