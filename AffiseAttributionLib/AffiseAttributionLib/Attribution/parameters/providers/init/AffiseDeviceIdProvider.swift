//
//  AffiseDeviceIdProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for parameter [Parameters.AFFISE_DEVICE_ID]
 *
 * @property useCase to retrieve affise device id
 */
class AffiseDeviceIdProvider: StringPropertyProvider {
    private let useCase: FirstAppOpenUseCase
    
    init(useCase: FirstAppOpenUseCase) {
        self.useCase = useCase
    }
    
    override func provide() -> String? {
        return useCase.getAffiseDeviseId()
    }
}
