import Foundation

internal enum SubscriptionEventName: String {
    case AF_PURCHASE = "afPurchase"
    case AF_FAILED_PURCHASE = "afFailedPurchase"
    case AF_SUBSCRIPTION = "afSubscription"
    case AF_RENEWED_SUBSCRIPTION = "afRenewedSubscription"
    case AF_FAILED_SUBSCRIPTION = "afFailedSubscription"
}

extension SubscriptionEventName: CaseIterable {
    public var eventName: String {
        return self.rawValue
    }

    public static func from(_ name: String) -> SubscriptionEventName? {
        return allCases.first { name == $0.eventName }
    }
}
