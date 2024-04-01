import AffiseAttributionLib
import Foundation
import UIKit


@objc(AffiseSubscriptionModule)
internal final class SubscriptionModule: AffiseModule  {

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
    
    public static func purchase(_ productId: String, _ type: AffiseProductType? = nil, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        guard let module = instance else {
            return callback(.failure(AffiseSubscriptionError.notInitialized))
        }
        module.storeManager.purchase(productId, type, callback)
    }
}
