import Foundation
import StoreKit
import AffiseAttributionLib


@available(iOS 15, *)
internal class TransactionManagerSK2: NSObject {
        
    private var productManager: ProductManager? = nil
    
    private var purchasedProducts: Set<String> = []

    init(productManager: ProductManager) {
        super.init()
        self.productManager = productManager
        
        self.transactionsUpdates()
    }
    
    func transactionsUpdates() {
        Task {
            for await update in Transaction.updates {
                guard case .verified(let transaction) = update else {
                    continue
                }
                
                await updatePurchases()
                await transaction.finish()

                if let product = self.getProduct(transaction.productID) {
                    self.onSuccess(transaction, product)
                }
            }
        }
    }
    
    func getProduct(_ productId: String) -> Product? {
        return self.productManager?.product(productId) as? Product
    }
    
    func updatePurchases() async {
        for await result in Transaction.currentEntitlements {
            guard let transaction = try? result.payloadValue else {
                continue
            }
            
            if transaction.revocationDate == nil {
                purchasedProducts.insert(transaction.productID)
            } else {
                purchasedProducts.remove(transaction.productID)
            }
        }
    }
    
    func onFailed(_ transaction: Transaction?, _ product: Product, _ type: AffiseProductType? = nil) {
        let productType = product.toAffiseSubscriptionType ?? type
        OperationEvent.createSK2(transaction, product: product, type: productType, failed: true)?
            .send()
    }
    
    func onSuccess(_ transaction: Transaction, _ product: Product, _ type: AffiseProductType? = nil) {
        let productType = product.toAffiseSubscriptionType ?? type
        OperationEvent.createSK2(transaction, product: product, type: productType, failed: false)?
            .send()
    }
    
    func purchase(_ product: Product, _ type: AffiseProductType?) async -> AffiseResult<AffisePurchasedInfo> {
        do {
            let result = try await product.purchase()
                switch result {
                case .success(.verified(let transaction)):
                    await transaction.finish()
                    onSuccess(transaction, product, type)
                    return .success(AffisePurchasedInfo(transaction, product.toAffiseProduct(type)))
                case .success(.unverified(let transaction, _)):
                    onSuccess(transaction, product, type)
                    return .success(AffisePurchasedInfo(transaction, product.toAffiseProduct(type)))
                case .pending:
                    break
                case .userCancelled:
                    onFailed(nil, product, type)
                    return .failure(AffiseSubscriptionError.userCancelled)
                @unknown default:
                    onFailed(nil, product, type)
                    return .failure(AffiseSubscriptionError.purchaseFailed(nil))
                }
        } catch {
            onFailed(nil, product, type)
            return .failure(error)
        }
        onFailed(nil, product, type)
        return .failure(AffiseSubscriptionError.purchaseFailed(nil))
    }
}

@available(iOS 15, *)
extension TransactionManagerSK2: TransactionManager {

    func purchase(_ product: AffiseProduct, _ type: AffiseProductType?, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        let productId = product.productId
        guard let skProduct = self.getProduct(productId) else {
            callback(.failure(AffiseSubscriptionError.productNotFound([productId])))
            return
        }
        Task {
            let result = await self.purchase(skProduct, type)
            callback(result)
        }
    }
}
