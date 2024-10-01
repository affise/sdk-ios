import Foundation
import StoreKit
import AffiseAttributionLib

internal enum OperationEvent {
    
    static func create(_ transaction: SKPaymentTransaction, product: SKProduct, type: AffiseProductType?, failed: Bool) -> Event? {
        var timeUnit = ""
        var numberOfUnits: Int64 = 0
        
        if #available(iOS 11.2, *) {
            timeUnit = product.subscriptionPeriod?.unitType.enumValue ?? ""
            numberOfUnits = Int64(product.subscriptionPeriod?.numberOfUnits ?? 0)
        }
        
        return create(
            orderId: transaction.transactionIdentifier,
            originalOrderId: transaction.original?.transactionIdentifier,
            productId: product.productIdentifier,
            timeUnit: timeUnit,
            numberOfUnits: numberOfUnits,
            price: product.price.floatValue,
            currency: product.priceLocale.currencyCode ?? "",
            
            type: type ?? product.toAffiseSubscriptionType ?? .CONSUMABLE,
            failed: failed
        )
    }
    
    @available(iOS 15, *)
    static func create(_ transaction: Transaction?, product: Product, type: AffiseProductType?, failed: Bool) -> Event? {
        var timeUnit = product.subscription?.subscriptionPeriod.unitType.enumValue ?? ""
        var numberOfUnits: Int = product.subscription?.subscriptionPeriod.value ?? 0
        var orderId: String? = nil
        var originalOrderId: String?  = nil
        
        if let transaction = transaction {
            orderId = "\(transaction.id)"
            originalOrderId = "\(transaction.originalID)"
        }
        
        return create(
            orderId: orderId,
            originalOrderId: originalOrderId,
            productId: "\(product.id)",
            timeUnit: timeUnit,
            numberOfUnits: Int64(numberOfUnits),
            price: NSDecimalNumber(decimal: product.price).floatValue,
            currency:  product.priceFormatStyle.currencyCode,
            
            type: product.toAffiseSubscriptionType ?? type ?? .CONSUMABLE,
            failed: failed
        )
    }
    
    static func create(orderId: String?, originalOrderId: String?, productId: String, timeUnit: String, numberOfUnits: Int64, price: Float, currency: String, type: AffiseProductType, failed: Bool) -> Event? {
        var event: Event?
        
        switch type {
        case .CONSUMABLE, .NON_CONSUMABLE:
            if failed {
                event = AfFailedPurchaseEvent()
            } else {
                event = AfPurchaseEvent()
            }
            let _ = event?
                .addPredefinedParameter(.PRODUCT_ID, string: productId)
                .addPredefinedParameter(.PRODUCT_TYPE, string: type.enumValue)

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

            let _ = event?
                .addPredefinedParameter(.SUBSCRIPTION_ID, string: productId)
                .addPredefinedParameter(.SUBSCRIPTION_TYPE, string: type.enumValue)
                .addPredefinedParameter(.UNIT, string: timeUnit)
                .addPredefinedParameter(.QUANTITY, long: numberOfUnits)

        default: break
        }

        return event?
            .addPredefinedParameter(.ORDER_ID, string: orderId ?? "")
            .addPredefinedParameter(.ORIGINAL_ORDER_ID, string: originalOrderId ?? "")
            .addPredefinedParameter(.CURRENCY, string: currency)
            .addPredefinedParameter(.PRICE, float: price)
    }
}
