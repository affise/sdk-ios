//
//  PostBackModelToJsonStringConverter.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Converter List<PostBackModel> to String
 */
class PostBackModelToJsonStringConverter : Converter {
    
    typealias T = Array<PostBackModel>
    typealias R = String

    private let EVENTS_KEY = "events"
    private let SDK_EVENTS_KEY = "sdk_events"
    private let METRICS_EVENTS_KEY = "metrics_events"
    private let INTERNAL_EVENTS_KEY = "internal_events"
    
    /**
     * Convert [from] list of PostBackModel to json string
     */
    func convert(from: Array<PostBackModel>) -> String {
        let res = from.map { model in
            parameters(obj: model)
        }.joined(separator: ",")
        return "[\(res)]"
    }

    /**
     * Create parameters map of object
     */
    private func parameters(obj: PostBackModel) -> String {
        var dict: [(String, Any?)] = []

        for item in obj.parameters {
            dict.append((item.0, item.1))
        }

        //Events
        let eventsArray = obj.events?.map { event in event.data } ?? []
        dict.append((Parameters.AFFISE_EVENTS_COUNT, eventsArray.count))
        dict.append((EVENTS_KEY, eventsArray))

        //Events
        let sdkEventsArray = obj.internalEvents?.map { event in event.data } ?? []
        dict.append((Parameters.AFFISE_INTERNAL_EVENTS_COUNT, sdkEventsArray.count))
        dict.append((INTERNAL_EVENTS_KEY, sdkEventsArray))

        //Logs
        let logsArray = obj.logs?.map { log in log.data } ?? []
        dict.append((Parameters.AFFISE_SDK_EVENTS_COUNT, logsArray.count))
        dict.append((SDK_EVENTS_KEY, logsArray))

        //Metrics
        let metricsArray = obj.metrics?.map { metric in metric.data } ?? []
        dict.append((Parameters.AFFISE_METRICS_EVENTS_COUNT, metricsArray.count))
        dict.append((METRICS_EVENTS_KEY, metricsArray))
        
        return dict.jsonString()
    }
}
