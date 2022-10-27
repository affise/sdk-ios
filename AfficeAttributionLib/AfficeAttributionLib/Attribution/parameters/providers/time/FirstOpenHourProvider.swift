//
//  FirstOpenHourProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for parameter [Parameters.FIRST_OPEN_HOUR]
 *
 * @property useCase to retrieve first open time from
 */
class FirstOpenHourProvider: LongPropertyProvider {
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
}
