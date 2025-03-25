import AffiseAttributionLib

protocol EventsFactory {
    func createEvents() -> [Event]
}
