protocol PersistentUseCase {
    func set(_ tag: String, _ value: String) -> Bool
    func get(_ tag: String) -> String?
    func getOrCreate(_ tag: String, _ value: String) -> String
}
