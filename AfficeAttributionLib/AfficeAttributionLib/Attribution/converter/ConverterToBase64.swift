//
//  ConverterToBase64.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation


/**
 *  Convert string to Base64 [encoded string]
 */
class ConverterToBase64 : Converter {

    typealias T = String
    typealias R = String
    
    /**
     * Convert [from] String to encode string with Base64
     */
    func convert(from: String) -> String  {
        return Data(from.utf8).base64EncodedString()
        
    }
}
