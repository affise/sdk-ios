//
//  AffiseSessionCountProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.AFFISE_SESSION_COUNT]
 *
 * @property sessionManager to retrieve session count
 */
internal class AffiseSessionCountProvider : LongPropertyProvider {
    
    private let sessionManager: SessionManager
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    override func provide() -> Int64? {
        var count = sessionManager.getSessionCount();
        if count == 0 {
            count = 1
        }
        return count
    }
}
