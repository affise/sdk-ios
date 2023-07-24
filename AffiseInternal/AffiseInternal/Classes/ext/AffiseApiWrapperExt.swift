internal extension Dictionary where Key == String, Value == Any? {
    func opt<T>(_ api: AffiseApiMethod) -> T? {
        return self.opt(api.method)
    }

    func opt<T>(_ api: String) -> T? {
        return self[api] as? T
    }
}
