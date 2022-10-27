//
//  AppVersionProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Provider for parameter [Parameters.APP_VERSION]
 */
class AppVersionProvider: StringPropertyProvider {
    private let bundle: Bundle
    
    init(bundle: Bundle) {
        self.bundle = bundle
    }
    
    override func provide() -> String? {
        return bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
