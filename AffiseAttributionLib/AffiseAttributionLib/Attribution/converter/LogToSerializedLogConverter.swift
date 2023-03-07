//
//  LogToSerializedLogConverter.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Converter AffiseLog to SerializedLog
 */
class LogToSerializedLogConverter : Converter {
    
    
    typealias T = AffiseLog
    typealias R = SerializedLog

    /**
     * Convert [from] AffiseLog to SerializedLog
     */
    func convert(from: AffiseLog) -> SerializedLog {
        //Generate id
        let id = generateUUID().uuidString.lowercased()

        //Type of log
        let type = from.name.rawValue

        //Generate parameters
        let value: Any = from.value

        //Generate data
        let parameters: [(String, Any?)] = [
            (type, value),
        ]
        
        //Create
        let dict: [(String, Any?)] = [
            //Add Id
            ("affise_sdkevent_id", id),
            
            //Add name
            ("affise_sdkevent_name", "affise_event_sdklog"),
            
            //Add timestamp
            ("affise_sdkevent_timestamp", Int(Date().timeIntervalSince1970)),
            
            //Add predefined parameters
            ("affise_sdkevent_parameters", parameters),
        ]

        //Create serialized object
        return SerializedLog(id: id, type: from.name.rawValue, data: dict.jsonString())
    }
}
