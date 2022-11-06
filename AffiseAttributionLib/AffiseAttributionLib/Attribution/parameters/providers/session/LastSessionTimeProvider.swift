//
//  LastSessionTimeProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for parameter [Parameters.LAST_SESSION_TIME]
 *
 * @property sessionManager to retrieve last interaction time
 */
class LastSessionTimeProvider : LongPropertyProvider {
    
    private let sessionManager: SessionManager
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    override func provide() -> Int64? {
        if let time = sessionManager.getLastInteractionTime() {
            return time.timeInMillis
        } else {
            return nil
        }
    }
}
