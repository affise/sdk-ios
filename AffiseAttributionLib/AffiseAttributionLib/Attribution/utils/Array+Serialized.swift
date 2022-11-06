//
//  Array+Serialized.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


extension Array where Element == (String, Any?) {
    func jsonString() -> String {
        let array: [String] = compactMap { (key, value) in
            guard let value = value else {
                return nil
            }
            if let value = value as? String, value.count > 0, value.first != "{" {
                return "\"\(key)\":\"\(value)\""
            } else if let value = value as? String, value.count == 0 {
                return "\"\(key)\":\"\""
            } else if let value = value as? [String], value.count > 0, value.first!.first != "{" {
                return "\"\(key)\":[\"\(value.joined(separator: "\",\""))\"]"
            } else if let value = value as? [String] {
                return "\"\(key)\":[\(value.joined(separator: ","))]"
            } else if let value = value as? [(String, Any?)] {
                return "\"\(key)\":\(value.jsonString())"
            } else if let value = value as? [[(String, Any?)]] {
                return "\"\(key)\":[\(value.map {$0.jsonString()}.joined(separator: ","))]"
            } else {
                return "\"\(key)\":\(value)"
            }
        }
        return "{\(array.joined(separator: ","))}"
    }
}
