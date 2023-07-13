//
//  AffisePackageAppNameProvider.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for parameter [Parameters.AFFISE_PKG_APP_NAME]
 *
 */
class AffisePackageAppNameProvider: StringPropertyProvider {
    private let bundle: Bundle
    
    init(bundle: Bundle) {
        self.bundle = bundle
    }
    
    override func provide() -> String? {
        return bundle.bundleIdentifier
    }
    
    override func getOrder() -> Float {
        2.0
    }

    override func getKey() -> String? {
        Parameters.AFFISE_PKG_APP_NAME
    }
}
