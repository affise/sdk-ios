import Foundation


public protocol AffiseSubscriptionApi {
    static func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>)

    static func purchase(_ product: AffiseProduct, _ type: AffiseProductType?, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>)
}
