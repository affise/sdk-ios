import Foundation
import StoreKit
import AffiseAttributionLib

internal class TransactionManager: NSObject {
    
    private let queue = DispatchQueue(label: "Affise.TransactionManager")
    
    private var productManager: ProductManager? = nil

    private var transactionProducts: [String: (SKProduct, AffiseProductType?)] = [:]

    private var callbacks: [String: ([AffiseResultCallback<AffisePurchasedInfo>], AffiseProductType?)] = [:]

    init(productManager: ProductManager) {
        super.init()
        SKPaymentQueue.default().add(self)
        self.productManager = productManager
    }
    
    func purchase(_ product: AffiseProduct, _ type: AffiseProductType?, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        queue.async { [weak self] in
            guard let self = self else { return }
            let productId = product.productId
            
            guard let product = self.productManager?.products[productId] else {
                callback(.failure(AffiseSubscriptionError.productNotFound([productId])))
                return
            }
            
            if let (callbacks, type) = self.callbacks[productId] {
                self.callbacks[productId] = (callbacks + [callback], type)
                return
            }

            self.callbacks[productId] = ([callback], type)
            self.transactionProducts[productId] = (product, type)

            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(payment)
        }
    }

    func failedTransaction(_ transaction: SKPaymentTransaction) {
        queue.async { [weak self] in
            guard let self = self else { return }
            SKPaymentQueue.default().finishTransaction(transaction)

            let productId = transaction.payment.productIdentifier
            guard let (product, type) = self.removeTransactionByProduct(productId) else {
                // TODO
                return
            }
            
            self.result(productId, .failure(AffiseSubscriptionError.purchaseFailed(transaction.error)))
                    
            OperationEvent.create(transaction, product: product, type: type, failed: true)?
                .send()
        }
    }

    func purchasedTransaction(_ transaction: SKPaymentTransaction) {
        queue.async { [weak self] in
            guard let self = self else { return }
            SKPaymentQueue.default().finishTransaction(transaction)
            
            let productId = transaction.payment.productIdentifier
            guard let (product, type) = self.removeTransactionByProduct(productId) else {
                // TODO
                return
            }
            
            self.result(productId, .success(AffisePurchasedInfo(transaction, product.toAffiseProduct(type))))
                        
            OperationEvent.create(transaction, product: product, type: type, failed: false)?
                .send()
        }
    }
    
    func removeTransactionByProduct(_ productId: String) -> (SKProduct, AffiseProductType?)? {
        return transactionProducts.removeValue(forKey: productId)
    }
    
    func result(_ productId: String, _ result: AffiseResult<AffisePurchasedInfo>) {
        queue.async { [weak self] in
            guard let self = self else { return }
                        
            guard let (callbacks, _) = self.callbacks.removeValue(forKey: productId) else {
                return
            }
            
            for callback in callbacks {
                callback(result)
            }
        }
    }
    
    func canMakePurchases() -> Bool { return SKPaymentQueue.canMakePayments() }
}


extension TransactionManager: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                purchasedTransaction(transaction)
                
            case .failed:
                failedTransaction(transaction)
                
            case .restored:
                SKPaymentQueue.default().finishTransaction(transaction)
                
            default: break
            }
        }
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, shouldAddStorePayment payment: SKPayment, for product: SKProduct) -> Bool {
        if canMakePurchases() {
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
            
            return true
        } else {
            return false
        }
    }
}
