//
//  PropertyProvider.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Base property provider
 */
internal class PropertyProvider<T> {
    /**
     * Default value of provider
     */
    private let defaultValue: T
    
    init(_ defaultValue: T) {
        self.defaultValue = defaultValue
    }
    
    /**
     * Provide data
     */
    func provide() -> T? { nil }
    
    /**
     * Provide data with default value
     */
    func provideWithDefault() -> T {
        return provide() ?? defaultValue
    }
}

/**
 * Base string property provider
 */
class StringPropertyProvider : PropertyProvider<String> {
    init() {
        super.init("")
    }
}

/**
 * Base boolean property provider
 */
class BooleanPropertyProvider : PropertyProvider<Bool> {
    init() {
        super.init(false)
    }
}

/**
 * Base long property provider
 */
class LongPropertyProvider : PropertyProvider<Int64> {
    init() {
        super.init(0)
    }
}

/**
 * Base string property provider with param
 */
class StringWithParamPropertyProvider {
    /**
     * Default value of provider
     */
    private let defaultValue = ""

    /**
     * Provide data with param
     */
    func provideWithParam(_ param: String) -> String? { nil }

    /**
     * Provide data with param and default value
     */
    func provideWithParamAndDefault(param: String) -> String {
        return provideWithParam(param) ?? defaultValue
    }
}
