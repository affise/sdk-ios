internal class EmptyStringProvider: StringPropertyProvider {
    
    private var order: Float = 0.0
    private var key: ProviderType? = nil

    init(_ key: ProviderType?, order: Float) {
        self.key = key
        self.order = order
    }

    override func provide() -> String? {
        ""
    }

    public override func getOrder() -> Float {
        order
    }

    public override func getKey() -> ProviderType? {
        key
    }
}