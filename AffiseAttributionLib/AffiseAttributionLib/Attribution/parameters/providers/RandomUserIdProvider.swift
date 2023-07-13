//
//  RandomUserIdProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for parameter [Parameters.RANDOM_USER_ID]
 *
 * @property useCase to retrieve random user id
 */
class RandomUserIdProvider: StringPropertyProvider {
    private let useCase: FirstAppOpenUseCase
    
    init(useCase: FirstAppOpenUseCase) {
        self.useCase = useCase
    }
    
    override func provide() -> String? {
        return useCase.getRandomUserId()
    }
    
    override func getOrder() -> Float {
        49.0
    }

    override func getKey() -> String? {
        Parameters.RANDOM_USER_ID
    }
}
