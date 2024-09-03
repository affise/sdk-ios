import Foundation

@objc
public class AffisePurchasedInfo: NSObject {
    public internal(set) var product: AffiseProduct?
    public internal(set) var orderId: String?
    public internal(set) var originalOrderId: String?
    public internal(set) var purchase: Any? = nil

    public internal(set) var operationDate: Date?

    public convenience init(
        _ transaction: Any?,
        _ product: AffiseProduct?,
        orderId: String? = nil,
        originalOrderId: String?,
        operationDate: Date?
    ) {
        self.init()
        self.product = product
        self.orderId = orderId
        self.originalOrderId = originalOrderId
        self.purchase = transaction
        self.operationDate = operationDate
    }

    override public var description: String {
        "AffisePurchasedInfo(productId=\"\(product?.productId ?? "")\", orderId=\"\(orderId ?? "")\", originalOrderId=\"\(originalOrderId ?? "")\")"
    }
}
