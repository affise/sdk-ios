//
//  LogsRepository.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Logs repository interface
 */
internal protocol LogsRepository {
    /**
     * Has logs by [url] or not
     */
    func hasLogs(url: String) -> Bool

    /**
     * Store log for all [urls]
     */
    func storeLog(log: AffiseLog, urls: [String])

    /**
     * Get log in current [url]
     */
    func getLogs(url: String) -> [SerializedLog]

    /**
     * Delete logs with [ids] in current [url]
     */
    func deleteLogs(ids: [String], url: String)

    /**
     * Removes all logs
     */
    func clear()
}
