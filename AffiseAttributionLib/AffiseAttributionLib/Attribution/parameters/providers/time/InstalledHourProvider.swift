//
//  InstalledHourProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Provider for parameter [Parameters.INSTALLED_HOUR]
 *
 * @property useCase to retrieve first open time from
 */
class InstalledHourProvider : LongPropertyProvider {
    private let useCase: FirstAppOpenUseCase
    
    init(useCase: FirstAppOpenUseCase) {
        self.useCase = useCase
    }
    
    override func provide() -> Int64? {
        guard let time = useCase.getFirstOpenDate() else {
            return nil
        }
        return time.stripTimestampToHours.timeInMillis
    }
    
    override func getOrder() -> Float {
        8.0
    }

    override func getKey() -> String? {
        Parameters.INSTALLED_HOUR
    }
}
