import Foundation
import StoreKit
import AffiseAttributionLib


internal extension Date {
    var toTimestamp: Int64 {
        Int64(self.timeIntervalSince1970 * 1000)
    } 
}

internal extension SKPaymentTransaction {
    
    var toTimestamp: Int64 {
        if let transactionDate = self.transactionDate {
            return transactionDate.toTimestamp
        } else {
            return Date().toTimestamp
        }
    }
}

internal extension SKProduct {
    
    var toAffiseSubscriptionType: AffiseProductType? {
        if #available(iOS 11.2, *) {
            if self.subscriptionPeriod != nil {
                return .RENEWABLE_SUBSCRIPTION
            }
        } else if #available(iOS 12.0, *) {
            if self.subscriptionGroupIdentifier != nil {
                return .RENEWABLE_SUBSCRIPTION
            }
        }
        return nil
    }
    
    var toAffiseProductPrice: AffiseProductPrice {
        return AffiseProductPrice(value: self.price.decimalValue, priceLocale: self.priceLocale)
    }
    
    var toAffiseProductSubscriptionDetail: AffiseProductSubscriptionDetail? {
        var offerId: String? = nil
        if #available(iOS 12.0, *) {
            offerId = self.subscriptionGroupIdentifier
        }
        if #available(iOS 11.2, *) {
            return self.subscriptionPeriod?.toAffiseProductSubscriptionDetail(offerId)
        }
        return nil
    }
    
    func endTimestap(start: Date) -> Int64 {
        if #available(iOS 11.2, *) {
            return self.subscriptionPeriod?.add(to: start).toTimestamp ?? 0
        } else {
            return 0
        }
    }
      
    func toAffiseProduct(_ type: AffiseProductType? = nil) -> AffiseProduct {
        return AffiseProduct(
            productId: self.productIdentifier,
            title: self.localizedTitle,
            productDescription: self.localizedDescription,
            productType: type ?? self.toAffiseSubscriptionType,
            price: self.toAffiseProductPrice,
            subscription: self.toAffiseProductSubscriptionDetail,
            productDetails: self
        )
    }
}

@available(iOS 11.2, *)
internal extension SKProductSubscriptionPeriod {
    
    func add(to: Date) -> Date {
        return Calendar.current.date(byAdding: self.calendarUnit, value: self.numberOfUnits, to: to) ?? to
    }
    
    var calendarUnit: Calendar.Component {
        switch self.unit {
        case .day:
            return .day
        case .week:
            return .weekOfYear
        case .month:
            return .month
        case .year:
            return .year
        default:
            return .day
        }
    }

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
    
    func toAffiseProductSubscriptionDetail(_ offerId: String?) -> AffiseProductSubscriptionDetail? {
        return AffiseProductSubscriptionDetail(
            offerId: offerId,
            timeUnit: self.unitType,
            numberOfUnits: self.numberOfUnits
        )
    }
}
