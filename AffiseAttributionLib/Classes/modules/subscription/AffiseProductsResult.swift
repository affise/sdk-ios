import Foundation


@objc
public class AffiseProductsResult: NSObject {

    public let products: [AffiseProduct]
    
    public let invalidIds: [String]
        
    public init(products: [AffiseProduct], invalid: [String]) {
        self.products = products
        self.invalidIds = invalid
    }

    public override var description: String {
        "AffiseProductsResult(products=[\(products.map { $0.productId }.joined(separator: ", "))], invalidIds=[\(invalidIds.joined(separator: ", "))])"
    }
}
