import Foundation
import AffiseAttributionLib


extension Affise: AffiseSubscriptionApi {
    
    public static func fetchProducts(_ ids: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>) {
        SubscriptionModule.fetchProducts(ids, callback)
    }
    
    public static func purchase(_ product: AffiseProduct, _ type: AffiseProductType? = nil, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        SubscriptionModule.purchase(product, type, callback)
    }
}
