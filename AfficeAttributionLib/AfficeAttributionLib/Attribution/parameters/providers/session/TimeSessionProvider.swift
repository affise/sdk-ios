//
//  TimeSessionProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for parameter [Parameters.TIME_SESSION]
 *
 * @property sessionManager to retrieve session time
 */
class TimeSessionProvider : LongPropertyProvider {
    
    private let sessionManager: SessionManager
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    override func provide() -> Int64? {
        return sessionManager.getSessionTime().timeInMillis
    }
}
