import Foundation
import StoreKit
import AffiseAttributionLib


public extension AffisePurchasedInfo {
    
    var skTransaction: SKPaymentTransaction? {
        self.skData as? SKPaymentTransaction
    }
    
    internal convenience init(_ transaction: SKPaymentTransaction, _ product: AffiseProduct?) {
        self.init(
            transaction,
            product,
            orderId: transaction.transactionIdentifier,
            originalOrderId: transaction.original?.transactionIdentifier,
            operationDate: transaction.transactionDate
        )
    }
}
