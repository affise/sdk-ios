//
//  LogsRepositoryImpl.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//


/**
 * Repository for logs models
 *
 * @property converterToBase64 convert string to encoding Base64 string
 * @property converterToSerializedLog to convert Event to SerializedEvent
 * @property logsStorage storage of logs
 */
internal class LogsRepositoryImpl : LogsRepository {
    
    private let converterToBase64: ConverterToBase64
    private let converterToSerializedLog: LogToSerializedLogConverter
    private let logsStorage: LogsStorage
    
    init(converterToBase64: ConverterToBase64,
         converterToSerializedLog: LogToSerializedLogConverter,
         logsStorage: LogsStorage) {
        
        self.converterToBase64 = converterToBase64
        self.converterToSerializedLog = converterToSerializedLog
        self.logsStorage = logsStorage
    }

    /**
     * Has logs by [url] or not
     */
    func hasLogs(url: String) -> Bool {
        return logsStorage.hasLogs(
            key: converterToBase64.convert(from: url),
            subKeys: AffiseLogType.values.map { converterToBase64.convert(from: $0.rawValue) }
        )
    }

    /**
     * Store [log]
     */
    func storeLog(log: AffiseLog, urls: [String]) {
        urls.forEach { url in
            logsStorage.saveLog(
                key: converterToBase64.convert(from: url),
                subKey: converterToBase64.convert(from: log.name.rawValue),
                log: converterToSerializedLog.convert(from: log)
            )
        }
    }

    /**
     * Get logs by [url]
     * @return logs
     */
    func getLogs(url: String) -> [SerializedLog] {
        return logsStorage.getLogs(
            key: converterToBase64.convert(from: url),
            subKeys: AffiseLogType.values.map { converterToBase64.convert(from: $0.rawValue) }
        )
    }

    /**
     * Removes all log by [ids] in [url]
     */
    func deleteLogs(ids: [String], url: String) {
        logsStorage.deleteLogs(
            key: converterToBase64.convert(from: url),
            subKeys: AffiseLogType.values.map { converterToBase64.convert(from: $0.rawValue) },
            ids: ids
        )
    }

    /**
     * Removes all Logs
     */
    func clear() {
        logsStorage.clear()
    }
}
