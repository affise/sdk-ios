//
//  StringToSHA256Converter.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import CommonCrypto


/**
 * Converter String to Sha256 String
 */
class StringToSHA256Converter : Converter {
    
    private static let ALGORITHM_NAME = "SHA-256"
    
    typealias T = String
    typealias R = String
    
    /**
     * Convert [from] to Sha256
     *
     * @return value of Sha256
     */
    func convert(from: String) -> String  {
        return from.sha256()
    }
}

extension Data {
    public func sha256() -> String{
        return hexStringFromData(input: digest(input: self as NSData))
    }
    
    private func digest(input : NSData) -> NSData {
        let digestLength = Int(CC_SHA256_DIGEST_LENGTH)
        var hash = [UInt8](repeating: 0, count: digestLength)
        CC_SHA256(input.bytes, UInt32(input.length), &hash)
        return NSData(bytes: hash, length: digestLength)
    }
    
    private  func hexStringFromData(input: NSData) -> String {
        var bytes = [UInt8](repeating: 0, count: input.length)
        input.getBytes(&bytes, length: input.length)
        
        var hexString = ""
        for byte in bytes {
            hexString += String(format:"%02x", UInt8(byte))
        }
        
        return hexString
    }
}

extension String {
    func sha256() -> String{
        if let stringData = self.data(using: String.Encoding.utf8) {
            return stringData.sha256()
        }
        return ""
    }
}
