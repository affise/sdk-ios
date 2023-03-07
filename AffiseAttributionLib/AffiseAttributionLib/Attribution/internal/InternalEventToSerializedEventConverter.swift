import Foundation

/**
 * Converter InternalEvent to SerializedEvent
 */
internal class InternalEventToSerializedEventConverter : Converter {


    typealias T = InternalEvent
    typealias R = SerializedEvent


    /**
     * Convert [from] InternalEvent to SerializedEvent
     */
    func convert(from: InternalEvent) -> SerializedEvent {
        //Generate id
        let id = generateUUID().uuidString.lowercased()

        //Create
        let dict: [(String, Any?)] = [
            //Add Id
            (InternalParameters.AFFISE_INTERNAL_EVENT_ID, id),
            //Add name
            (InternalParameters.AFFISE_INTERNAL_EVENT_NAME, from.getName()),
            //Add timestamp
            (InternalParameters.AFFISE_INTERNAL_EVENT_TIMESTAMP, from.getTimestamp()),
            //Add event data
            (InternalParameters.AFFISE_INTERNAL_EVENT_DATA, from.serialize()),
        ]

        //Create SerializedEvent
        return SerializedEvent(id: id, data: dict.jsonString())
    }
}
