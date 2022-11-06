//
//  AffPartParamNameTokenPropertyProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for property [Parameters.AFFISE_PART_PARAM_NAME_TOKEN]
 *
 * @property initProperties to retrieve part param name token
 */
class AffPartParamNameTokenPropertyProvider: StringPropertyProvider {
    private let storage: InitPropertiesStorage
    
    init(storage: InitPropertiesStorage) {
        self.storage = storage
    }
    
    override func provide() -> String? {
        return storage.getProperties()?.partParamNameToken
    }
}
