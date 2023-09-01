import Foundation

internal class CustomLongProvider : LongPropertyProvider {
    
    private var order: Float = 0.0
    private var key: String? = nil
    private var invoke: (() -> Int64?)? = nil

    init(_ key: String?, order: Float, provide: (() -> Int64?)? = nil) {
        self.key = key
        self.order = order
        self.invoke = provide
    }

    override func provide() -> Int64? {
        return invoke?()
    }

    public override func getOrder() -> Float {
        order
    }

    public override func getKey() -> String? {
        key
    }
}
