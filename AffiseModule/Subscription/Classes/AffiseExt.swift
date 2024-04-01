import AffiseAttributionLib


extension Affise: AffiseSubscriptionApi {
    
    public static func fetchProducts(_ ids: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>) {
        SubscriptionModule.fetchProducts(ids, callback)
    }
    
    public static func purchase(_ id: String, _ type: AffiseProductType? = nil, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>) {
        SubscriptionModule.purchase(id, type, callback)
    }
}
