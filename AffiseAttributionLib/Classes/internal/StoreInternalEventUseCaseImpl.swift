class StoreInternalEventUseCaseImpl {
    private let repository: InternalEventsRepository

    init(repository: InternalEventsRepository) {
        self.repository = repository
    }
}

extension StoreInternalEventUseCaseImpl: StoreInternalEventUseCase {

    func storeInternalEvent(event: InternalEvent) {
        DispatchQueue.global(qos:.background).async { [weak self] in
            //Save event
            self?.repository.storeEvent(event: event, urls: CloudConfig.urls)
        }
    }
}
