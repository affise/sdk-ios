//
//  LifetimeSessionCountProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.LIFETIME_SESSION_COUNT]
 *
 * @property sessionManager to retrieve lifetime session time
 */
class LifetimeSessionCountProvider : LongPropertyProvider {
    
    private let sessionManager: SessionManager
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    override func provide() -> Int64? {
        return sessionManager.getLifetimeSessionTime().timeInMillis
    }
    
    override func getOrder() -> Float {
        57.0
    }

    override func getKey() -> String? {
        Parameters.LIFETIME_SESSION_COUNT
    }
}
