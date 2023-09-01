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
    
    public override func getOrder() -> Float {
        63.0
    }

    public override func getKey() -> String? {
        Parameters.AFFISE_SDK_SECRET_ID
    }
}
