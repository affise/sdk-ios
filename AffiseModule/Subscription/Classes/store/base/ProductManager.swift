import Foundation
import StoreKit
import AffiseAttributionLib

protocol ProductManager {
    func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>)

    func product(_ id: String) -> Any
}
