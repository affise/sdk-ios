import Foundation


class AffiseSubscription : NSObject, AffiseModuleApiWrapper {
    typealias API = AffiseSubscriptionApi
    var api: API?
    var module: AffiseModules = .Subscription
}

extension AffiseSubscription : AffiseModuleSubscriptionApi {
    
    func hasModule() -> Bool { hasModule }
    
    func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>) {
        moduleApi?.fetchProducts(productsIds, callback)
    }
    
    func purchase(_ product: AffiseProduct, _ type: AffiseProductType?, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        moduleApi?.purchase(product, type, callback)
    }
}
