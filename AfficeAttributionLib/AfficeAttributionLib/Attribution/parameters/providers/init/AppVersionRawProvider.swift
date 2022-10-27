//
//  AppVersionRawProvider.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * App version number (Android) [Parameters.APP_VERSION_RAW]
 */
class AppVersionRawProvider: StringPropertyProvider {
    private let bundle: Bundle
    
    init(bundle: Bundle) {
        self.bundle = bundle
    }
    
    override func provide() -> String? {
        return bundle.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
}
