import AffiseAttributionLib


internal class StoreManager: NSObject {
    
    lazy var productManager: ProductManager = ProductManager()
    lazy var transactionManager: TransactionManager = TransactionManager(productManager: productManager)

    func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>) {
        productManager.fetchProducts(productsIds, callback)
    }
    
    func purchase(_ productId: String, _ type: AffiseProductType?, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        transactionManager.purchase(productId, type, callback)
    }
}

