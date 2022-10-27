//
//  AffiseAltDeviceIdProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for parameter [Parameters.AFFISE_ALT_DEVICE_ID]
 *
 * @property useCase to retrieve affise alt device id
 */
class AffiseAltDeviceIdProvider: StringPropertyProvider {
    private let useCase: FirstAppOpenUseCase
    
    init(useCase: FirstAppOpenUseCase) {
        self.useCase = useCase
    }
    
    override func provide() -> String? {
        return useCase.getAffiseAltDeviseId()
    }
}
