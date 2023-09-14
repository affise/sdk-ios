public extension Dictionary where Key == String, Value == Any? {
    func opt<T>(_ api: AffiseApiMethod) -> T? {
        return self.opt(api.method)
    }
    
    internal func opt<T>(_ api: AffiseBuilderProperty) -> T? {
        return self.opt(api.type)
    }

    func opt<T>(_ api: String) -> T? {
        return self[api] as? T
    }
    
    func toArray() -> [(String, Any?)] {
        return map {
            var value = $0.value
            if let subMap = value as? [String: Any?] {
                value = subMap.toArray()
            }
            return ($0.key, value)
        }
    }
}
