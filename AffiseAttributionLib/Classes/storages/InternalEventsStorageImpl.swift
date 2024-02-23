import Foundation

class InternalEventsStorageImpl {
    
    private let logsManager: LogsManager
    private let fileManager: FileManager
    
    private lazy var applicationSupportURL: URL = {
            let urls = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask)
            return urls[0]
    }()
    
    private lazy var eventsDirectory: URL = {
            return applicationSupportURL.appendingPathComponent(InternalEventsParams.INTERNAL_EVENTS_DIR_NAME)
    }()
    
    init(logsManager: LogsManager, fileManager: FileManager) {
        self.logsManager = logsManager
        self.fileManager = fileManager
        
        if !fileManager.fileExists(atPath: applicationSupportURL.path) {
            do {
                try fileManager.createDirectory(atPath: applicationSupportURL.path,
                                                withIntermediateDirectories: true,
                                                attributes: nil)
            } catch {
                //Log error
                logsManager.addUserError(error: error)
            }
        }
        
        if !fileManager.fileExists(atPath: eventsDirectory.path) {
            do {
                try fileManager.createDirectory(atPath: eventsDirectory.path,
                                                withIntermediateDirectories: true,
                                                attributes: nil)
            } catch {
                //Log error
                logsManager.addUserError(error: error)
            }
        }
    }
    
    /**
     * Get events directory by [key] (subDir)
     * @return dir for events
     */
    private func eventsDirectory(key: String) throws -> URL {
        let dir = eventsDirectory.appendingPathComponent(key)
        if !fileManager.fileExists(atPath: dir.path) {
            try fileManager.createDirectory(atPath: dir.path,
                                            withIntermediateDirectories: true,
                                            attributes: nil)
        }
        
        return dir
    }
}

extension InternalEventsStorageImpl: InternalEventsStorage {
    /**
     * Has save events by [key] or not
     */
    func hasEvents(key: String) -> Bool {
        do {
            let directoryContents = try fileManager.contentsOfDirectory(
                at: eventsDirectory(key: key),
                includingPropertiesForKeys: nil
            )
            return !directoryContents.isEmpty
        } catch {
            //Log error
            logsManager.addSdkError(error: error)
        }
        
        return false
    }
    
    /**
     * Store [event] by [key]
     */
    func saveEvent(key: String, event: SerializedEvent) {
        do {
            let fileUrl = try eventsDirectory(key: key).appendingPathComponent(event.id)
            let data = event.data.data(using: .utf8)!
            try data.write(to: fileUrl)
        } catch {
            //Log error
            logsManager.addSdkError(error: error)
        }
    }
    
    /**
     * Get serialized events by [key]
     *
     * @return list of serialized events
     */
    func getEvents(key: String) -> Array<SerializedEvent> {
        do {
            let directoryContents = try fileManager.contentsOfDirectory(
                at: eventsDirectory(key: key),
                includingPropertiesForKeys: nil
            )
            
            let events = try directoryContents.filter({ fileURL in
                let attr = try fileManager.attributesOfItem(atPath: fileURL.path)
                guard let creationDate = attr[.modificationDate] as? Date else { return true }
                if (creationDate.timeIntervalSince1970 < Date().timeIntervalSinceNow - Double(InternalEventsParams.INTERNAL_EVENTS_STORE_TIME)) {
                    do {
                        try fileManager.removeItem(atPath: fileURL.path)
                    } catch {
                        //Log error
                        logsManager.addSdkError(error: error)
                    }
                    return false
                } else {
                    return true
                }
            }).suffix(InternalEventsParams.INTERNAL_EVENTS_SEND_COUNT)
                .map { fileURL -> SerializedEvent in
                    let data = try Data(contentsOf: fileURL)
                    let json = String(data: data, encoding: .utf8)!
                    return SerializedEvent(id: fileURL.lastPathComponent, data: json)
                }
            return events
        } catch {
            //Log error
            logsManager.addSdkError(error: error)
            return []
        }
    }
    
    /**
     * Delete event for [key] by [ids]
     */
    func deleteEvent(key: String, ids: Array<String>) {
        ids.forEach { id in
            do {
                try fileManager.removeItem(atPath: eventsDirectory(key: key).appendingPathComponent(id).path)
            } catch {
                //Log error
                logsManager.addSdkError(error: error)
            }
        }
    }
    
    
    /**
     * Removes all events
     */
    func clear() {
        do {
            try fileManager.removeItem(at: eventsDirectory)
        } catch {
            //Log error
            logsManager.addSdkError(error: error)
        }
    }
}
