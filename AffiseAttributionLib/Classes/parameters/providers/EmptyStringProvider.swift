import Foundation

internal class EmptyStringProvider: StringPropertyProvider {
    
    private var order: Float = 0.0
    private var key: String? = nil

    init(_ key: String?, order: Float) {
        self.key = key
        self.order = order
    }

    override func provide() -> String? {
        ""
    }

    public override func getOrder() -> Float {
        order
    }

    public override func getKey() -> String? {
        key
    }
}