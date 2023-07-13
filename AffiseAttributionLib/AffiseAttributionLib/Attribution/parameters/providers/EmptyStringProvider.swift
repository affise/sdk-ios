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

    override func getOrder() -> Float {
        order
    }

    override func getKey() -> String? {
        key
    }
}