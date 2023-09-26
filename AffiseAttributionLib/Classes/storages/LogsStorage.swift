//
//  LogsStorage.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//


internal protocol LogsStorage {
    func hasLogs(key: String, subKeys: Array<String>) -> Bool
    func saveLog(key: String, subKey: String, log: SerializedLog)
    func getLogs(key: String, subKeys: Array<String>) -> Array<SerializedLog>
    func deleteLogs(key: String, subKeys: Array<String>, ids: Array<String>)
    func clear()
}
