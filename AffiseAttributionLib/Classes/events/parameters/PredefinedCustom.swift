@objc
public class PredefinedCustom: NSObject {
    private var predefinedParameters: [(String, Any?)] = []

    @objc
    public func conversionId(_ orderId: String, _ productId: String) -> String {
        let conversionId = "\(orderId)_\(productId)"
        add(PredefinedString.ORDER_ID, orderId)
        add(PredefinedString.PRODUCT_ID, productId)
        add(PredefinedString.CONVERSION_ID, conversionId)
        return conversionId
    }

    private func add(_ predefined: Predefined, _ value: Any) {
        predefinedParameters.append((predefined.value(), value))
    }

    internal func get() -> [(String, Any?)] {
        return predefinedParameters
    }
}
