import Foundation
import StoreKit
import AffiseAttributionLib

internal enum OperationEvent {
    static func create(_ transaction: SKPaymentTransaction, product: SKProduct, type: AffiseProductType?, failed: Bool) -> Event? {
        var event: Event?
        var eventType: AffiseProductType = type ?? .CONSUMABLE
        if product.isSubscription {
            eventType = .RENEWABLE_SUBSCRIPTION
        }

        let orderId: String? = transaction.transactionIdentifier
        let originalOrderId: String? = transaction.original?.transactionIdentifier

        switch eventType {
        case .CONSUMABLE, .NON_CONSUMABLE:
            if failed {
                event = AfFailedPurchaseEvent()
            } else {
                event = AfPurchaseEvent()
            }
            let _ = event?
                .addPredefinedParameter(.PRODUCT_ID, string: product.productIdentifier)
                .addPredefinedParameter(.PRODUCT_TYPE, string: eventType.enumValue)

        case .RENEWABLE_SUBSCRIPTION, .NON_RENEWABLE_SUBSCRIPTION:
            if failed {
                event = AfFailedSubscriptionEvent()
            } else {
                if (originalOrderId ?? "").isEmpty {
                    event = AfSubscriptionEvent()
                } else {
                    event = AfRenewedSubscriptionEvent()
                }
            }

            var timeUnit = ""
            var numberOfUnits: Int64 = 0

            if #available(iOS 11.2, *) {
                timeUnit = product.subscriptionPeriod?.unitType.enumValue ?? ""
                numberOfUnits = Int64(product.subscriptionPeriod?.numberOfUnits ?? 0)
            }

            let _ = event?
                .addPredefinedParameter(.SUBSCRIPTION_ID, string: product.productIdentifier)
                .addPredefinedParameter(.SUBSCRIPTION_TYPE, string: eventType.enumValue)
                .addPredefinedParameter(.UNIT, string: timeUnit)
                .addPredefinedParameter(.QUANTITY, long: numberOfUnits)

        default: break
        }

        return event?
            .addPredefinedParameter(.ORDER_ID, string: orderId ?? "")
            .addPredefinedParameter(.ORIGINAL_ORDER_ID, string: originalOrderId ?? "")
            .addPredefinedParameter(.CURRENCY, string: product.priceLocale.currencyCode ?? "")
            .addPredefinedParameter(.PRICE, float: product.price.floatValue)
    }
}
