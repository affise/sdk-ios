internal protocol IsFirstForUserStorage {
    func add(_ eventClass: String)
    func getEventsNames() -> Array<String>
}
