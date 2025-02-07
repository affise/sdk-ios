import Foundation

public struct PostBackModel {
    let parameters: [(ProviderType, Any?)]
    
    let events: Array<SerializedEvent>?
    let logs: Array<SerializedLog>?
    let metrics: Array<SerializedEvent>?
    let internalEvents: Array<SerializedEvent>?
}

extension PostBackModel {
    func asFirstOpen() -> PostBackModel {
        return PostBackModel(
            parameters: self.parameters.map {(key, value) in
                if key == ProviderType.INSTALL_FIRST_EVENT {
                    return (key, true)
                } else {
                    return (key, value)
                }
            },
            events: self.events,
            logs: self.logs,
            metrics: self.metrics,
            internalEvents: self.internalEvents
        )
    }
}
