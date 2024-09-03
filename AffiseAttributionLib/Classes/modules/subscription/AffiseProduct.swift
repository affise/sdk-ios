import Foundation


@objc
public class AffiseProduct: NSObject {

    public internal(set) var productId: String
    public internal(set) var title: String
    public internal(set) var productDescription: String
    
    public internal(set) var productType: AffiseProductType?

    public internal(set) var price: AffiseProductPrice?
    public internal(set) var subscription: AffiseProductSubscriptionDetail?

    public internal(set) var productDetails: Any? = nil
    
    public init(
        productId: String,
        title: String,
        productDescription: String,
        productType: AffiseProductType?,
        price: AffiseProductPrice?,
        subscription: AffiseProductSubscriptionDetail?,
        productDetails: Any?
    ) {
        self.productId = productId
        self.title = title
        self.productDescription = productDescription
        self.productType = productType
        self.price = price
        self.subscription = subscription
        self.productDetails = productDetails
    }
    
    public func asConsumable() -> AffiseProduct {
        self.productType = .CONSUMABLE
        return self
    }
    
    public func asNonConsumable() -> AffiseProduct {
        self.productType = .NON_CONSUMABLE
        return self
    }
    
    public func asNonSubscription() -> AffiseProduct {
        self.productType = .RENEWABLE_SUBSCRIPTION
        return self
    }
    
    public func asNonRenewableSubscription() -> AffiseProduct {
        self.productType = .NON_RENEWABLE_SUBSCRIPTION
        return self
    }
    
    public override var description: String {
        "AffiseProduct(productId=\"\(productId)\", title=\"\(title)\", productDescription=\"\(productDescription)\", price=\"\(price?.description ?? "")\", type=\"\(productType?.enumValue ?? "")\")"
    }
}
