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
            guard let productId = product.productId else { return }
            
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
            let (product, type) = self.removeTransactionByProduct(productId)
            
            self.result(productId, .failure(AffiseSubscriptionError.purchaseFailed(transaction.error)))
            
            guard let product = product else {
                return
            }
                    
            self.createEvent(transaction, product: product, type: type, failed: true)?
                .send()
        }
    }

    func purchasedTransaction(_ transaction: SKPaymentTransaction) {
        queue.async { [weak self] in
            guard let self = self else { return }
            SKPaymentQueue.default().finishTransaction(transaction)
            
            let productId = transaction.payment.productIdentifier
            let (product, type) = self.removeTransactionByProduct(productId)
            
            self.result(productId, .success(AffisePurchasedInfo(transaction, AffiseProduct(product, type))))
            
            guard let product = product else {
                return
            }
                        
            self.createEvent(transaction, product: product, type: type, failed: false)?
                .send()
        }
    }
    
    func removeTransactionByProduct(_ productId: String) -> (SKProduct?, AffiseProductType?) {
        var product: SKProduct? = nil
        var type: AffiseProductType? = nil
        
        if let (transactionProduct, transactionProductType) = transactionProducts.removeValue(forKey: productId) {
            product = transactionProduct
            type = transactionProductType
        }
        
        return (product, type)
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
    
    func createEvent(_ transaction: SKPaymentTransaction, product: SKProduct, type: AffiseProductType?, failed: Bool) -> Event? {
        var event: Event?
        var eventType: AffiseProductType = type ?? .CONSUMABLE
        if product.isSubscription {
            eventType = .RENEWABLE_SUBSCRIPTION
        }
        
        let orderId: String? = transaction.transactionIdentifier
        let originalOrderId: String? = transaction.original?.transactionIdentifier
        
        switch eventType {
        case .CONSUMABLE, .NON_CONSUMABLE:
            if failed {
                event = FailedPurchaseEvent()
            } else {
                event = PurchaseEvent()
            }
            let _ = event?
                .addPredefinedParameter(.PRODUCT_ID, string: product.productIdentifier)
                .addPredefinedParameter(.PRODUCT_TYPE, string: eventType.enumValue)
        
        case .RENEWABLE_SUBSCRIPTION, .NON_RENEWABLE_SUBSCRIPTION:
            if failed {
                event = FailedSubscriptionEvent()
            } else {
                if (originalOrderId ?? "").isEmpty {
                    event = SubscribeEvent()
                } else {
                    event = RenewedSubscriptionEvent()
                }
            }
            
            var timeUnit: String = ""
            var numberOfUnits: Int64 = 0
            
            if #available(iOS 11.2, *) {
                timeUnit = product.subscriptionPeriod?.unitType.enumValue ?? ""
                numberOfUnits = Int64(product.subscriptionPeriod?.numberOfUnits ?? 0 )
            }
            
            let _ = event?
                .addPredefinedParameter(.SUBSCRIPTION_ID, string: product.productIdentifier)
                .addPredefinedParameter(.SUBSCRIPTION_TYPE, string: eventType.enumValue)
                .addPredefinedParameter(.UNIT, string: timeUnit)
                .addPredefinedParameter(.QUANTITY, long: numberOfUnits)
        
        default: break
        }
        
        return event?
            .addPredefinedParameter(.ORDER_ID, string: orderId ?? "")
            .addPredefinedParameter(.ORIGINAL_ORDER_ID, string: originalOrderId ?? "")
            .addPredefinedParameter(.CURRENCY, string: product.priceLocale.currencyCode ?? "")
            .addPredefinedParameter(.PRICE, float: product.price.floatValue)
    }
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
