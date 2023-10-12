internal class PostBackModelFactory {
    
    private var providers: [Provider]
    
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
            parameters: getProvidersMap(),
            events: events,
            logs: logs,
            metrics: metrics,
            internalEvents: internalEvents
        )
    }

    func getProvidersMap() -> [(ProviderType, Any?)] {
        return providers.mapProviders()
    }

    func getProvider<T>() -> T? where T : Provider {
        providers.first(where: { $0 is T }) as? T
    }
    
    func addProviders(_ list: [Provider]) {
        providers.append(contentsOf: list)
    }
    
    func getProviders() -> [Provider] {
        return providers
    }

    func getProviders(_ types: [Provider.Type]) -> [Provider] {
        return providers.getProviders(types)
    }
    
    func getRequestProviders() -> [Provider] {
        return providers.getRequestProviders()
    }
}
