class IsFirstForUserStorageImpl {
    
    private let logsManager: LogsManager
    private let fileManager: FileManager
    
    private let FILE_NAME = "first-for-user"
    
    private lazy var applicationSupportURL: URL = {
        let urls = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        return urls[0]
    }()
    
    private lazy var eventsDirectory: URL = {
        return applicationSupportURL.appendingPathComponent(EventsParams.EVENTS_DIR_NAME)
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
     * Get events sent file
     * @return file for events sent
     */
    private func getEventsFile() throws -> URL {
        let fileDir = eventsDirectory.appendingPathComponent(FILE_NAME)
        if !fileManager.fileExists(atPath: eventsDirectory.path) {
            try fileManager.createDirectory(atPath: eventsDirectory.path,
                                            withIntermediateDirectories: true,
                                            attributes: nil)
        }
        
        if !fileManager.fileExists(atPath: fileDir.path) {
            fileManager.createFile(
                atPath: fileDir.path,
                contents : nil,
                attributes: nil
            )
        }
        
        return fileDir
    }
}

extension IsFirstForUserStorageImpl: IsFirstForUserStorage {
    
    func add(_ eventClass: String) {
        do {
            let fileUrl = try getEventsFile()
            let data = "\(eventClass)\n".data(using: .utf8)!
            if let handle = try? FileHandle(forWritingTo: fileUrl) {
                handle.seekToEndOfFile()
                handle.write(data)
                handle.closeFile()
            }
        } catch {
            //Log error
            logsManager.addSdkError(error: error)
        }
    }
    
    func getEventsNames() -> Array<String> {
        do {
            let fileUrl = try getEventsFile()
            let data = try Data(contentsOf: fileUrl)
            let dataString = String(data: data, encoding: .utf8)!
            return dataString.components(separatedBy: "\n")
        } catch {
            //Log error
            logsManager.addSdkError(error: error)
        }
        return []
    }
}
