//
//  AffiseAltDeviceIdProvider.swift
//  AffiseAttributionLib
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
    
    override func getOrder() -> Float {
        28.0
    }

    override func getKey() -> String? {
        Parameters.AFFISE_ALT_DEVICE_ID
    }
}
