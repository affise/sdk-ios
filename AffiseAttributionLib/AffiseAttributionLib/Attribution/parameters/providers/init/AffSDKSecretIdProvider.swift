//
//  AffSDKSecretIdProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for parameter [Parameters.AFFISE_SDK_SECRET_ID]
 *
 * @property initProperties to retrieve id from
 */
class AffSDKSecretIdProvider: StringPropertyProvider {
    private let storage: InitPropertiesStorage
    
    init(storage: InitPropertiesStorage) {
        self.storage = storage
    }
    
    override func provide() -> String? {
        return storage.getProperties()?.secretKey
    }
    
    override func getOrder() -> Float {
        63.0
    }

    override func getKey() -> String? {
        Parameters.AFFISE_SDK_SECRET_ID
    }
}
