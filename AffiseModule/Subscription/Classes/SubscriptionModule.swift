import Foundation
import UIKit
import AffiseAttributionLib


@objc(AffiseSubscriptionModule)
public final class SubscriptionModule: AffiseModule {
    
    public override var version: String { "1.6.46" }
    
    lazy var storeManager: StoreManager = StoreManager()

    override public func start() {
    }
}


extension SubscriptionModule: AffiseSubscriptionApi {
    
    public func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>) {
        storeManager.fetchProducts(productsIds, callback)
    }
    
    public func purchase(_ product: AffiseProduct, _ type: AffiseProductType? = nil, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        storeManager.purchase(product, type, callback)
    }
}
