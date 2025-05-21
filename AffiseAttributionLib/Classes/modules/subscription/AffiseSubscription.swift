import Foundation


class AffiseSubscription : NSObject, AffiseModuleApiWrapper {
    typealias API = AffiseSubscriptionApi
    var api: API?
    var module: AffiseModules = .Subscription
    var moduleManager: AffiseModuleManager?
    
    init(_ moduleManager: AffiseModuleManager?) {
        self.moduleManager = moduleManager
    }
}

extension AffiseSubscription : AffiseSubscriptionApi {
    
    func hasModule() -> Bool { api != nil }
    
    func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>) {
        moduleApi?.fetchProducts(productsIds, callback)
    }
    
    func purchase(_ product: AffiseProduct, _ type: AffiseProductType?, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        moduleApi?.purchase(product, type, callback)
    }
}

extension AffiseSubscription {
    @available(*, deprecated, message: "Method moved to Affise.Module.Subscription", renamed: "Module.Subscription.hasModule")
    public static func hasSubscriptionModule() -> Bool {
        return Affise.Module.Subscription.hasModule()
    }
    
    @available(*, deprecated, message: "Method moved to Affise.Module.Subscription", renamed: "Module.Subscription.fetchProducts")
    public static func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>) {
        Affise.Module.Subscription.fetchProducts(productsIds, callback)
    }
    
    @available(*, deprecated, message: "Method moved to Affise.Module.Subscription", renamed: "Module.Subscription.purchase")
    public static func purchase(_ product: AffiseProduct, _ type: AffiseProductType?, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        Affise.Module.Subscription.purchase(product, type, callback)
    }
}

extension Affise.Module {
    
    @available(*, deprecated, message: "Method moved to Affise.Module.Subscription", renamed: "Module.Subscription.hasModule")
    public static func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>) {
        Affise.Module.Subscription.fetchProducts(productsIds, callback)
    }
    
    @available(*, deprecated, message: "Method moved to Affise.Module.Subscription", renamed: "Module.Subscription.fetchProducts")
    public static func purchase(_ product: AffiseProduct, _ type: AffiseProductType?, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        Affise.Module.Subscription.purchase(product, type, callback)
    }
    
    @available(*, deprecated, message: "Method moved to Affise.Module.Subscription", renamed: "Module.Subscription.purchase")
    public static func hasSubscriptionModule() -> Bool {
        return Affise.Module.Subscription.hasModule()
    }
}
