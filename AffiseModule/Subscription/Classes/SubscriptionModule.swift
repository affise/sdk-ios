import Foundation
import UIKit
import AffiseAttributionLib


@objc(AffiseSubscriptionModule)
public final class SubscriptionModule: AffiseModule {

    private(set) static var instance: SubscriptionModule? = nil
    
    lazy var storeManager: StoreManager = StoreManager()

    override public func start() {  
        SubscriptionModule.instance = self
    }
}


extension SubscriptionModule: AffiseSubscriptionApi {
    
    public static func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>) {
        guard let module = instance else {
            return callback(.failure(AffiseSubscriptionError.notInitialized))
        }
        module.storeManager.fetchProducts(productsIds, callback)
    }
    
    public static func purchase(_ product: AffiseProduct, _ type: AffiseProductType? = nil, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        guard let module = instance else {
            return callback(.failure(AffiseSubscriptionError.notInitialized))
        }
        module.storeManager.purchase(product, type, callback)
    }
}
