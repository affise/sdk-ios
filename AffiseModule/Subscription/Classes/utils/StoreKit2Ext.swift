import Foundation
import StoreKit
import AffiseAttributionLib


@available(iOS 15, *)
internal extension Product {

    var currencyCode: String {
    #if compiler(>=5.7)
        return self.priceFormatStyle.currencyCode
    #else
        return ""
    #endif
    }
    
    var toAffiseSubscriptionType: AffiseProductType? {
        switch self.type {
        case .consumable:
            return AffiseProductType.CONSUMABLE
        case .nonConsumable:
            return AffiseProductType.NON_CONSUMABLE
        case .autoRenewable:
            return AffiseProductType.RENEWABLE_SUBSCRIPTION
        case .nonRenewable:
            return AffiseProductType.NON_RENEWABLE_SUBSCRIPTION
        default:
            return nil
        }
    }

    var toAffiseProductPrice: AffiseProductPrice {       
        return AffiseProductPrice(
            value: self.price,
            currencyCode: currencyCode,
            formattedPrice: self.displayPrice
        )
    }

    var toAffiseProductSubscriptionDetail: AffiseProductSubscriptionDetail? {
        return self.subscription?.toAffiseProductSubscriptionDetail()
    }
      
    func toAffiseProduct(_ type: AffiseProductType? = nil) -> AffiseProduct {
        return AffiseProduct(
            productId: self.id,
            title: self.displayName,
            productDescription: self.description,
            productType: self.toAffiseSubscriptionType ?? type,
            price: self.toAffiseProductPrice,
            subscription: self.toAffiseProductSubscriptionDetail,
            productDetails: self
        )
    }
}


@available(iOS 15, *)
internal extension Product.SubscriptionInfo {
    
    func toAffiseProductSubscriptionDetail() -> AffiseProductSubscriptionDetail? {
        return AffiseProductSubscriptionDetail(
            offerId: self.subscriptionGroupID,
            timeUnit: self.subscriptionPeriod.unitType,
            numberOfUnits: self.subscriptionPeriod.value
        )
    }
}


@available(iOS 15, *)
internal extension Product.SubscriptionPeriod {
    
    var unitType: TimeUnitType {
        switch self.unit {
        case .day:
             return .DAY
        case .week:
            return .WEEK
        case .month:
            return .MONTH
        case .year:
            return .YEAR
        default:
            return .DAY
        }
    }
}
