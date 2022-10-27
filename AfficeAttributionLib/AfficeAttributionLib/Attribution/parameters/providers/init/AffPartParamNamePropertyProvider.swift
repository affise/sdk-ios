//
//  AffPartParamNamePropertyProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for property [Parameters.AFFISE_PART_PARAM_NAME]
 *
 * @property initProperties to retrieve part param name
 */
class AffPartParamNamePropertyProvider: StringPropertyProvider {
    private let storage: InitPropertiesStorage
    
    init(storage: InitPropertiesStorage) {
        self.storage = storage
    }
    
    override func provide() -> String? {
        return storage.getProperties()?.partParamName
    }
}
