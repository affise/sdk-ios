import Foundation
import StoreKit
import AffiseAttributionLib


public extension AffiseProduct {

    var skProduct: SKProduct? {
        self.productDetails as? SKProduct
    }
    
    @available(iOS 15, *)
    var sk2Product: Product? {
        self.productDetails as? Product
    }
}
