import Foundation


@objc
public class AffisePurchasedInfo: NSObject {

    public internal(set) var product: AffiseProduct?
    
    public internal(set) var operationDate: Date?
    
    public internal(set) var orderId: String?
    
    public internal(set) var originalOrderId: String?

    public internal(set) var skData: Any? = nil
    
    public convenience init(_ transaction: Any?, _ product: AffiseProduct?, orderId: String? = nil, originalOrderId: String?, operationDate: Date?) {
        self.init()
        self.skData = transaction
        self.product = product
        self.orderId = orderId
        self.originalOrderId = originalOrderId
        self.operationDate = operationDate
    }
    
    public override var description: String {
        "AffisePurchasedInfo(productId=\"\(product?.productId ?? "")\", orderId=\"\(orderId ?? "")\", originalOrderId=\"\(originalOrderId ?? "")\")"
    }
}
