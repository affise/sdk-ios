import Foundation
import StoreKit
import AffiseAttributionLib


@available(iOS 15, *)
internal class ProductManagerSK2: NSObject {
        
    private(set) var products: [String: Product] = [:]

    func getInvalid(_ productsIds: [String]) -> [String] {
        let valid = self.products.keys
        return productsIds.filter { id in
            !valid.contains(id)
        }
    }

    func updateProducts(_ skProducts: [Product]) -> [AffiseProduct] {
        self.products = skProducts.reduce(into: [:]) { dict, product in
            dict[product.id] = product
        }
        return self.products.map { $0.value.toAffiseProduct() }
    }
    
    func fetch(_ productsIds: [String]) async -> AffiseResult<AffiseProductsResult> {
        do {
            let skProducts  = try await Product.products(for: productsIds)
            let products: [AffiseProduct] = updateProducts(skProducts)
            let invalid = getInvalid(productsIds)
            return .success(AffiseProductsResult(products: products, invalid: invalid))
        } catch {
            return .failure(error)
        }
        return .failure(AffiseSubscriptionError.productNotFound(productsIds))
    }
}

@available(iOS 15, *)
extension ProductManagerSK2: ProductManager {

    func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>) {
        Task {
            let result = await self.fetch(productsIds)
            callback(result)
        }
    }

    func product(_ id: String) -> Any {
        return self.products[id] as Any
    }
}
