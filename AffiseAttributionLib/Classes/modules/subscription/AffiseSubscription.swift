class AffiseSubscription {
    private static var api: AffiseSubscriptionApi? {
        get {
            if module != nil {
                return module
            } else {
                module = Affise.Module.getApi(.Subscription) as? AffiseSubscriptionApi
            }
            return module
        }
    }

    private static var module: AffiseSubscriptionApi? = nil
    
    public static func hasSubscriptionModule() -> Bool {
        return api != nil
    }
    
    public static func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>) {
        api?.fetchProducts(productsIds, callback)
    }

    public static func purchase(_ product: AffiseProduct, _ type: AffiseProductType?, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        api?.purchase(product, type, callback)
    }
}


extension Affise.Module {
    public static func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>) {
        AffiseSubscription.fetchProducts(productsIds, callback)
    }

    public static func purchase(_ product: AffiseProduct, _ type: AffiseProductType?, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        AffiseSubscription.purchase(product, type, callback)
    }
    
    public static func hasSubscriptionModule() -> Bool {
        return AffiseSubscription.hasSubscriptionModule()
    }
}
