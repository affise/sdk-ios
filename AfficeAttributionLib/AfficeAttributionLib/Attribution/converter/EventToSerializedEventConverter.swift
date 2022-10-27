//
//  EventToSerializedEventConverter.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Converter Event to SerializedEvent
 */
internal class EventToSerializedEventConverter : Converter {

    
    typealias T = Event
    typealias R = SerializedEvent
    
    
    /**
     * Convert [from] Event to SerializedEvent
     */
    func convert(from: Event) -> SerializedEvent {
        //Generate id
        let id = UUID().uuidString

        //Create
        let dict: [(String, Any?)] = [
            //Add Id
            (Parameters.AFFISE_EVENT_ID, id),
            //Add name
            (Parameters.AFFISE_EVENT_NAME, from.getName()),
            //Add category
            (Parameters.AFFISE_EVENT_CATEGORY, from.getCategory()),
            //Add timestamp
            (Parameters.AFFISE_EVENT_TIMESTAMP, Int(Date().timeIntervalSince1970)),
            //Add is first for user Or not
            (Parameters.AFFISE_EVENT_FIRST_FOR_USER, from.isFirstForUser()),
            //Add user data
            (Parameters.AFFISE_EVENT_USER_DATA, from.getUserData()),
            //Add event data
            (Parameters.AFFISE_EVENT_DATA, from.serialize()),
            
            //Add predefined parameters
            (Parameters.AFFISE_PARAMETERS, from.predefinedParameters
                .map{ (key: String, value: Any?) in key }),
        ]

        //Create SerializedEvent
        return SerializedEvent(id: id, data: dict.jsonString())
    }
}
