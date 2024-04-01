import Foundation

@objc
public class AffiseProduct: NSObject {
    
    public internal(set) var type: AffiseProductType?

    public internal(set) var productId: String?

    public internal(set) var localizedTitle: String?

    public internal(set) var localizedDescription: String?

    public internal(set) var price: Decimal?

    public internal(set) var currencyCode: String?

    public internal(set) var currencySymbol: String?

    public internal(set) var regionCode: String?

    public internal(set) var priceLocale: Locale?

    public internal(set) var skData: Any? = nil
    
    public convenience init(
        type: AffiseProductType?,
        productId: String?,
        localizedTitle: String?,
        localizedDescription: String?,
        price: Decimal?,
        priceLocale: Locale?,
        skData: Any?
    ) {
        self.init()
        self.type = type
        self.productId = productId
        self.localizedTitle = localizedTitle
        self.localizedDescription = localizedDescription
        self.price = price
        self.currencyCode = priceLocale?.currencyCode
        self.currencySymbol = priceLocale?.currencySymbol
        self.regionCode = priceLocale?.regionCode
        self.priceLocale = priceLocale
        self.skData = skData
    }
    
    public override var description: String {
        "AffiseProduct(productId=\"\(productId ?? "")\", localizedTitle=\"\(localizedTitle ?? "")\", price=\"\(price ?? 0)\", currencyCode=\"\(currencyCode ?? "")\", type=\"\(type?.enumValue ?? "")\")"
    }
}
