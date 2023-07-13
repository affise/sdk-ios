//
//  IsProductionPropertyProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for property [Parameters.AFFISE_SDK_POS]
 *
 * @property initProperties to retrieve is production
 */
class IsProductionPropertyProvider: StringPropertyProvider {    
    private static let TYPE_SANDBOX = "Sandbox"
    private static let TYPE_PRODUCTION = "Production"
    
    private let storage: InitPropertiesStorage
    
    init(storage: InitPropertiesStorage) {
        self.storage = storage
    }
    
    override func provide() -> String {
        if (storage.getProperties()?.isProduction ?? false) {
            return IsProductionPropertyProvider.TYPE_PRODUCTION
        } else {
            return IsProductionPropertyProvider.TYPE_SANDBOX
        }
    }
    
    override func getOrder() -> Float {
        50.0
    }

    override func getKey() -> String? {
        Parameters.AFFISE_SDK_POS
    }
}
