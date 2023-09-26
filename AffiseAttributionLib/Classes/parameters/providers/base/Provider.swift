public protocol Provider {
    func getOrder() -> Float
    func getKey() -> ProviderType?
}
