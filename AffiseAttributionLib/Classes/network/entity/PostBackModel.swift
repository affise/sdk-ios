struct PostBackModel {
    let parameters: [(ProviderType, Any?)]
    
    let events: Array<SerializedEvent>?
    let logs: Array<SerializedLog>?
    let metrics: Array<SerializedEvent>?
    let internalEvents: Array<SerializedEvent>?
}
