public protocol AffiseSubscriptionApi {
    static func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>)
    
    static func purchase(_ productId: String, _ type: AffiseProductType?, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>)
}
