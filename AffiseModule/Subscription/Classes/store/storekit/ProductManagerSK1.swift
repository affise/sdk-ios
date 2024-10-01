import Foundation
import StoreKit
import AffiseAttributionLib


internal class ProductManagerSK1: NSObject {
    
    private let queue = DispatchQueue(label: "Affise.ProductFetcher")
    
    private(set) var products: [String: SKProduct] = [:]
    
    private var callbacks: [[String]: [AffiseResultCallback<AffiseProductsResult>]] = [:]
    
    private var requests: [SKRequest:[String]] = [:]
    
    func productsRequest(_ ids: [String]) {
        let request = SKProductsRequest(productIdentifiers: Set(ids))
        request.delegate = self
        requests[request] = ids
        request.start()
    }
}


extension ProductManagerSK1: SKProductsRequestDelegate {
        
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        queue.async { [weak self] in
            guard let self = self else { return }
            
            guard let (ids, callbacks) = self.getIdsCallbacks(request) as? ([String], [AffiseResultCallback<AffiseProductsResult>]) else {
                return
            }
            
            let invalid: [String] = response.invalidProductIdentifiers
            
            if !response.products.isEmpty {
                self.products = response.products.reduce(into: [:]) { dict, product in
                    dict[product.productIdentifier] = product
                }
                
                let products: [AffiseProduct] = self.products.map { $0.value.toAffiseProduct() }
                
                for callback in callbacks {
                    callback(.success(AffiseProductsResult(products: products, invalid: invalid)))
                }
            } else {
                for callback in callbacks {
                    callback(.failure(AffiseSubscriptionError.productNotFound(ids)))
                }
            }
        }
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        defer { request.cancel() }
        queue.async { [weak self] in
            guard let self = self else { return }
            
            guard let (_, callbacks) = self.getIdsCallbacks(request) as? ([String], [AffiseResultCallback<AffiseProductsResult>]) else {
                return
            }
            
            for callback in callbacks {
                callback(.failure(error))
            }
        }
    }
    
    func requestDidFinish(_ request: SKRequest) {
        request.cancel()
    }
    
    private func getIdsCallbacks(_ request: SKRequest) -> ([String]?, [AffiseResultCallback<AffiseProductsResult>]?) {
        guard let ids = self.requests[request] else {
            return (nil, nil)
        }
        
        self.requests.removeValue(forKey: request)
        
        guard let handlers = self.callbacks.removeValue(forKey: ids) else {
            return (nil, nil)
        }
        
        return (ids, handlers)
    }
}

extension ProductManagerSK1: ProductManager {

    func fetchProducts(_ productsIds: [String], _ callback: @escaping AffiseResultCallback<AffiseProductsResult>) {
        queue.async { [weak self] in
            guard let self = self else { return }
            
            if let callbacks = self.callbacks[productsIds] {
                self.callbacks[productsIds] = callbacks + [callback]
                return
            }
            
            self.callbacks[productsIds] = [callback]
            self.productsRequest(productsIds)
        }
    }

    func product(_ id: String) -> Any {
        return self.products[id]
    }
}
