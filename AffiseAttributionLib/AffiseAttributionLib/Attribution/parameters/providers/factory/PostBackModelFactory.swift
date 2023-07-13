//
//  PostBackModelFactory.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation


internal class PostBackModelFactory {
    
    private let providers: [Provider]
    
    init(providers: [Provider]) {
        self.providers = providers
    }

    /**
     * Create PostBackModel with [events] and [logs]
     *
     * @return PostBackModel
     */
    func create(
        events: Array<SerializedEvent> = [],
        logs: Array<SerializedLog> = [],
        metrics: Array<SerializedEvent> = [],
        internalEvents: Array<SerializedEvent> = []
    ) -> PostBackModel {
        return PostBackModel(
            parameters: mapProviders(),
            events: events,
            logs: logs,
            metrics: metrics,
            internalEvents: internalEvents
        )
    }

    private func mapProviders() -> [(String, Any?)] {
        return providers.mapProviders()
    }

    func getProvider<T>() -> T? where T : Provider {
        providers.first(where: {$0 is T}) as? T
    }
}
