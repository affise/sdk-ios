import Foundation
import StoreKit
import AffiseAttributionLib

internal enum OperationEvent {
    
    static func createSK1(_ transaction: SKPaymentTransaction, product: SKProduct, type: AffiseProductType?, failed: Bool) -> Event? {
        return createEventWithParameters(
            orderId: transaction.transactionIdentifier,
            originalOrderId: transaction.original?.transactionIdentifier,
            productId: product.productIdentifier,
            timeUnit: product.subscriptionPeriod?.unitType.enumValue ?? "",
            numberOfUnits: Int64(product.subscriptionPeriod?.numberOfUnits ?? 0),
            price: product.price.floatValue,
            currency: product.priceLocale.currencyCode ?? "",
            
            type: type ?? product.toAffiseSubscriptionType ?? .CONSUMABLE,
            failed: failed
        )
    }
    
    @available(iOS 15, *)
    static func createSK2(_ transaction: Transaction?, product: Product, type: AffiseProductType?, failed: Bool) -> Event? {
        return createEventWithParameters(
            orderId: transaction?.id.toString,
            originalOrderId: transaction?.originalID.toString,
            productId: product.id,
            timeUnit: product.subscription?.subscriptionPeriod.unitType.enumValue ?? "",
            numberOfUnits: Int64(product.subscription?.subscriptionPeriod.value ?? 0),
            price: NSDecimalNumber(decimal: product.price).floatValue,
            currency: product.currencyCode,
            
            type: product.toAffiseSubscriptionType ?? type ?? .CONSUMABLE,
            failed: failed
        )
    }
    
    static func createEventWithParameters(orderId: String?, originalOrderId: String?, productId: String, timeUnit: String, numberOfUnits: Int64, price: Float, currency: String, type: AffiseProductType, failed: Bool) -> Event? {
        let event: Event = createEventByType(type, originalOrderId, failed)
            .addPredefinedParameter(.ORDER_ID, string: orderId ?? "")
            .addPredefinedParameter(.ORIGINAL_ORDER_ID, string: originalOrderId ?? "")
            .addPredefinedParameter(.CURRENCY, string: currency)
            .addPredefinedParameter(.PRICE, float: price)
        
        switch type {
        case .CONSUMABLE, .NON_CONSUMABLE:
            return event
                .addPredefinedParameter(.PRODUCT_ID, string: productId)
                .addPredefinedParameter(.PRODUCT_TYPE, string: type.enumValue)

        case .RENEWABLE_SUBSCRIPTION, .NON_RENEWABLE_SUBSCRIPTION:
            return event
                .addPredefinedParameter(.SUBSCRIPTION_ID, string: productId)
                .addPredefinedParameter(.SUBSCRIPTION_TYPE, string: type.enumValue)
                .addPredefinedParameter(.UNIT, string: timeUnit)
                .addPredefinedParameter(.QUANTITY, long: numberOfUnits)
        default:
            return event
        }
    }

    static func createEventByType(_ type: AffiseProductType, _ originalOrderId: String?, _ failed: Bool) -> Event {
        switch type {
        case .CONSUMABLE, .NON_CONSUMABLE:
            if failed {
                return AfFailedPurchaseEvent()
            } else {
                return AfPurchaseEvent()
            }

        case .RENEWABLE_SUBSCRIPTION, .NON_RENEWABLE_SUBSCRIPTION:
            if failed {
                return AfFailedSubscriptionEvent()
            } else {
                if originalOrderId.isNullOrBlank {
                    return AfSubscriptionEvent()
                } else {
                    return AfRenewedSubscriptionEvent()
                }
            }
        @unknown default:
            return AfPurchaseEvent()
        }
    }
}
