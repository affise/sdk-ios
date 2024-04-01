import Foundation

public enum AffiseSubscriptionError: Error {
    case notInitialized
    case productNotFound([String])
    case purchaseFailed(Error?)
}

extension AffiseSubscriptionError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .notInitialized: return "affise not initialized"
        case .productNotFound(let ids): return "product not found [\(ids.joined(separator: ", "))]"
        case .purchaseFailed(let error): return "purchase failed: \(error)"
        }
    }
}
