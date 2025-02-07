/**
 * Converter List<PostBackModel> to String
 */
public class PostBackModelToJsonStringConverter : Converter {
    
    public typealias T = Array<PostBackModel>
    public typealias R = String

    private let EVENTS_KEY = "events"
    private let SDK_EVENTS_KEY = "sdk_events"
    private let METRICS_EVENTS_KEY = "metrics_events"
    private let INTERNAL_EVENTS_KEY = "internal_events"

    private let indexUseCase: IndexUseCase

    init(indexUseCase: IndexUseCase) {
        self.indexUseCase = indexUseCase
    }
    
    /**
     * Convert [from] list of PostBackModel to json string
     */
    public func convert(from: Array<PostBackModel>) -> String {
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
            dict.append((item.0.provider, item.1))
        }

        // PostBack index
        dict.append((Parameters.UUID_INDEX_KEY, indexUseCase.getUuidIndex()))

        //Events
        let eventsArray = obj.events?.compactEvent() ?? []
        dict.append((Parameters.AFFISE_EVENTS_COUNT, eventsArray.count))
        dict.append((EVENTS_KEY, eventsArray))

        //Internal Events
        let sdkEventsArray = obj.internalEvents?.compactEvent() ?? []
        dict.append((Parameters.AFFISE_INTERNAL_EVENTS_COUNT, sdkEventsArray.count))
        dict.append((INTERNAL_EVENTS_KEY, sdkEventsArray.compactMap { $0 }))

        //Logs
        let logsArray = obj.logs?.compactLog() ?? []        
        dict.append((Parameters.AFFISE_SDK_EVENTS_COUNT, logsArray.count))
        dict.append((SDK_EVENTS_KEY, logsArray))

        //Metrics
        let metricsArray = obj.metrics?.compactEvent() ?? []
        dict.append((Parameters.AFFISE_METRICS_EVENTS_COUNT, metricsArray.count))
        dict.append((METRICS_EVENTS_KEY, metricsArray))
        
        return dict.jsonString()
    }
}
