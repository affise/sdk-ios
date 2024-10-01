import Foundation
import AffiseAttributionLib


internal class StoreManager: NSObject {
    
    lazy var productManager: ProductManager = {
        if #available(iOS 15.0, *) {
            return ProductManagerSK2()
        }
        return ProductManagerSK1()
    }()

    lazy var transactionManager: TransactionManager = {
        if #available(iOS 15.0, *) {
            return TransactionManagerSK2(productManager: productManager)
        }
        return TransactionManagerSK1(productManager: productManager)
    }()
   

    func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>) {
        productManager.fetchProducts(productsIds, callback)
    }
    
    func purchase(_ product: AffiseProduct, _ type: AffiseProductType?, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        transactionManager.purchase(product, type, callback)
    }
}

