//
//  HardwareNameProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//


/**
 * Provider for parameter [ProviderType.HARDWARE_NAME]
 */
class HardwareNameProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        return UIDevice.current.model
    }
    
    public override func getOrder() -> Float {
        23.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.HARDWARE_NAME
    }
}
