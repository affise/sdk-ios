//
//  AffAppTokenPropertyProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for property [Parameters.AFFISE_APP_TOKEN]
 *
 * @property initProperties to retrieve appToken
 */
class AffAppTokenPropertyProvider: StringWithParamPropertyProvider {
    private let storage: InitPropertiesStorage
    private let stringToSHA256Converter: StringToSHA256Converter
    
    init(storage: InitPropertiesStorage, stringToSHA256Converter: StringToSHA256Converter) {
        self.storage = storage
        self.stringToSHA256Converter = stringToSHA256Converter
    }
    
    override func provideWithParam(_ param: String) -> String {
        return stringToSHA256Converter.convert(
            from: (storage.getProperties()?.affiseAppId ?? "") +
            param +
            (storage.getProperties()?.secretKey ?? "")
        )
    }   

    override func getOrder() -> Float {
        61.0
    }

    override func getKey() -> String? {
        Parameters.AFFISE_APP_TOKEN
    }
}
