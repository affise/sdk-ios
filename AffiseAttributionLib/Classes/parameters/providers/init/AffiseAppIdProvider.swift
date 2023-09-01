//
//  AffiseAppIdProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for parameter [Parameters.AFFISE_APP_ID]
 *
 * @property storage to retrieve affise app id
 */
public class AffiseAppIdProvider: StringPropertyProvider { 
    private let storage: InitPropertiesStorage
    
    init(storage: InitPropertiesStorage) {
        self.storage = storage
    }
    
    override func provide() -> String? {
        return storage.getProperties()?.affiseAppId
    }
    
    public override func getOrder() -> Float {
        1.0
    }

    public override func getKey() -> String? {
        Parameters.AFFISE_APP_ID
    }
}
