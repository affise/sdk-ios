import Foundation
import StoreKit
import AffiseAttributionLib


public extension AffiseProduct {

    var skProduct: SKProduct? {
        self.productDetails as? SKProduct
    }
}
