//
//  InstalledTimeProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.INSTALLED_TIME]
 *
 * @property useCase to retrieve first open time from
 */
class InstalledTimeProvider : LongPropertyProvider {
    private let useCase: FirstAppOpenUseCase
    
    init(useCase: FirstAppOpenUseCase) {
        self.useCase = useCase
    }
    
    override func provide() -> Int64? {
        guard let time = useCase.getFirstOpenDate() else {
            return nil
        }
        return time.timeInMillis
    }
}
