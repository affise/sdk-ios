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
public class AffiseDeviceIdProvider: StringPropertyProvider {
    private let useCase: FirstAppOpenUseCase
    
    init(useCase: FirstAppOpenUseCase) {
        self.useCase = useCase
    }
    
    override func provide() -> String? {
        return useCase.getAffiseDeviseId()
    }
    
    public override func getOrder() -> Float {
        27.0
    }

    public override func getKey() -> String? {
        Parameters.AFFISE_DEVICE_ID
    }
}
