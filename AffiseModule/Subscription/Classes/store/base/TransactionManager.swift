import Foundation
import StoreKit
import AffiseAttributionLib

protocol TransactionManager {
    func purchase(_ product: AffiseProduct, _ type: AffiseProductType?, _ callback: @escaping AffiseResultCallback<AffisePurchasedInfo>)
}
