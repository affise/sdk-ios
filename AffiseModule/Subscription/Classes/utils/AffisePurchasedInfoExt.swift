import Foundation
import StoreKit
import AffiseAttributionLib


public extension AffisePurchasedInfo {
    
    var skTransaction: SKPaymentTransaction? {
        self.purchase as? SKPaymentTransaction
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
    
    
    @available(iOS 15, *)
    internal convenience init(_ transaction: Transaction, _ product: AffiseProduct?) {
        self.init(
            transaction,
            product,
            orderId: "\(transaction.id)",
            originalOrderId: "\(transaction.originalID)",
            operationDate: transaction.purchaseDate
        )
    }
}
