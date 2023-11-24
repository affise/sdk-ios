import Foundation

class LogsStorageImpl {
    
    private static let LOGS_DIR_NAME = "affise-logs"
    private static let LOGS_MAX_COUNT = 5
    
    private let fileManager: FileManager
    
    private lazy var applicationSupportURL: URL = {
        let urls = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        return urls[0]
    }()
    
    private lazy var logsDirectory: URL = {
        return applicationSupportURL.appendingPathComponent(LogsStorageImpl.LOGS_DIR_NAME)
    }()
    
    init(fileManager: FileManager) {
        self.fileManager = fileManager
        
        if !fileManager.fileExists(atPath: applicationSupportURL.path) {
            do {
                try fileManager.createDirectory(atPath: applicationSupportURL.path,
                                                withIntermediateDirectories: true,
                                                attributes: nil)
            } catch {
                print(error)
            }
        }
        
        if !fileManager.fileExists(atPath: logsDirectory.path) {
            do {
                try fileManager.createDirectory(atPath: logsDirectory.path,
                                                withIntermediateDirectories: true,
                                                attributes: nil)
            } catch {
                print(error)
            }
        }
    }
    
    
    /**
     * Get logs directory be [key] and [subKey]
     */
    private func logsDirectory(key: String, subKey: String? = nil) throws -> URL {
        var dir = logsDirectory
        if !key.isEmpty {
            let dir = logsDirectory.appendingPathComponent(key)
            if !fileManager.fileExists(atPath: dir.path) {
                try fileManager.createDirectory(atPath: dir.path,
                                                withIntermediateDirectories: true,
                                                attributes: nil)
            }
        }
        
        if let subKey = subKey, !subKey.isEmpty {
            dir = logsDirectory.appendingPathComponent(subKey)
            if !fileManager.fileExists(atPath: dir.path) {
                try fileManager.createDirectory(atPath: dir.path,
                                                withIntermediateDirectories: true,
                                                attributes: nil)
            }
        }
        
        return dir
    }
}


extension LogsStorageImpl: LogsStorage {
    
    /**
     * Has logs by [url] or not
     */
    func hasLogs(key: String, subKeys: Array<String>) -> Bool {
        
        var res = false
        
        do {
            let results = try subKeys.map { subKey -> Bool in
                let directoryContents = try fileManager.contentsOfDirectory(
                    at: logsDirectory(key: key, subKey: subKey),
                    includingPropertiesForKeys: nil
                )
                return !directoryContents.isEmpty
            }
            
            results.forEach { r in
                res = res || r
            }
        } catch {
            print(error)
        }
        
        return res
    }
    
    /**
     * Store not send [log] by [key] and [subKey]
     */
    func saveLog(key: String, subKey: String, log: SerializedLog) {
        
        do {
            var directoryContents = try fileManager.contentsOfDirectory(
                at: logsDirectory(key: key, subKey: subKey),
                includingPropertiesForKeys: nil
            )
            
            try directoryContents.sort(by: { file1, file2 in
                let attr = try fileManager.attributesOfItem(atPath: file1.path)
                let creationDate1 = (attr[.modificationDate] as! Date)
                let attr2 = try fileManager.attributesOfItem(atPath: file2.path)
                let creationDate2 = (attr2[.modificationDate] as! Date)
                
                return creationDate1.compare(creationDate2) == .orderedDescending
            })
            
            if (directoryContents.count > 4) {
                try directoryContents
                    .suffix(from: LogsStorageImpl.LOGS_MAX_COUNT - 1)
                    .forEach { fileURL in
                        try fileManager.removeItem(atPath: fileURL.path)
                    }
            }
            
            let fileUrl = try logsDirectory(key: key, subKey: subKey).appendingPathComponent(log.id)
            let data = log.data.data(using: .utf8)!
            try data.write(to: fileUrl)
        } catch {
            print(error)
        }
    }
    
    /**
     * Get logs by [key] and [subKeys]
     */
    func getLogs(key: String, subKeys: Array<String>) -> Array<SerializedLog> {
        do {
            return try subKeys.flatMap { subKey -> [SerializedLog] in
                
                let directoryContents = try fileManager.contentsOfDirectory(
                    at: logsDirectory(key: key, subKey: subKey),
                    includingPropertiesForKeys: nil
                )
                
                let logs = try directoryContents.map { fileURL -> SerializedLog in
                    let data = try Data(contentsOf: fileURL)
                    let json = String(data: data, encoding: .utf8)!
                    return SerializedLog(id: fileURL.lastPathComponent, type: subKey, data: json)
                }
                return logs
                
            }
        } catch {
            print(error)
            return []
        }
    }
    
    /**
     * Delete logs by [key] and [subKeys] only in [ids]
     */
    func deleteLogs(key: String, subKeys: Array<String>, ids: Array<String>) {
        do {
            try subKeys.map { subKey in
                try logsDirectory(key: key, subKey: subKey)
            }.map({ fileURL in
                try fileManager.contentsOfDirectory(
                    at: fileURL,
                    includingPropertiesForKeys: nil
                )
            }).forEach { directoryContents in
                try directoryContents.forEach { fileURL in
                    try ids.forEach { id in
                        if (fileURL.pathComponents.contains(id)) {
                            try fileManager.removeItem(atPath: fileURL.path)
                        }
                    }
                    
                }
            }
            
        } catch {
            print(error)
        }
    }
    
    /**
     * Removes all logs
     */
    func clear() {
        do {
            try fileManager.removeItem(at: logsDirectory)
        } catch {
            print(error)
        }
    }
}
