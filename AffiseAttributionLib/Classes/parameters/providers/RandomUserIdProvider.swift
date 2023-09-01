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
public class RandomUserIdProvider: StringPropertyProvider {
    private let useCase: FirstAppOpenUseCase
    
    init(useCase: FirstAppOpenUseCase) {
        self.useCase = useCase
    }
    
    override func provide() -> String? {
        return useCase.getRandomUserId()
    }
    
    public override func getOrder() -> Float {
        49.0
    }

    public override func getKey() -> String? {
        Parameters.RANDOM_USER_ID
    }
}
