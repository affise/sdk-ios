@objc
public class AffiseProductsResult: NSObject {

    public let products: [String: AffiseProduct]
    
    public let invalidIds: [String]
        
    public init(products: [String: AffiseProduct], invalid: [String]) {
        self.products = products
        self.invalidIds = invalid
    }

    public override var description: String {
        "AffiseProductsResult(products=[\(products.keys.joined(separator: ", "))], invalidIds=[\(invalidIds.joined(separator: ", "))])"
    }
}
