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
public class PropertyProvider<T> : Provider {
    public func getOrder() -> Float {
        0
    }
    
    public func getKey() -> String? {
        nil
    }
    
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
public class StringPropertyProvider : PropertyProvider<String> {
    init() {
        super.init("")
    }
}

/**
 * Base boolean property provider
 */
public class BooleanPropertyProvider : PropertyProvider<Bool> {
    init() {
        super.init(false)
    }
}

/**
 * Base long property provider
 */
public class LongPropertyProvider : PropertyProvider<Int64> {
    init() {
        super.init(0)
    }
}

/**
 * Base string property provider with param
 */
public class StringWithParamPropertyProvider : Provider {
    public func getOrder() -> Float {
        0
    }
    
    public func getKey() -> String? {
        nil
    }
    
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
