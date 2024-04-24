import Foundation
import StoreKit
import AffiseAttributionLib


public extension AffiseProduct {

    var skProduct: SKProduct? {
        self.skData as? SKProduct
    }
    
    internal convenience init(_ product: SKProduct?, _ type: AffiseProductType? = nil) {
        self.init(
            type: type,
            productId: product?.productIdentifier,
            localizedTitle: product?.localizedTitle,
            localizedDescription: product?.localizedDescription,
            price: product?.price.decimalValue ?? 0,
            priceLocale: product?.priceLocale,
            skData: product
        )
    }
}
