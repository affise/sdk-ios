import AffiseAttributionLib
import Foundation

public class DataMapper {
    public static func fromDeeplinkValue(_ data: DeeplinkValue) -> [String: Any?] {
        return [
            DataName.DEEPLINK: data.deeplink,
            DataName.SCHEME: data.scheme as Any,
            DataName.HOST: data.host as Any,
            DataName.PATH: data.path as Any,
            DataName.PARAMETERS: data.parameters,
        ]
    }

    public static func fromRequest(_ data: HttpRequest) -> [String: Any?] {
        return [
            DataName.METHOD: data.method.rawValue,
            DataName.URL: data.url.absoluteString,
            DataName.HEADERS: data.headers,
            DataName.BODY: "\(data.body?.toJsonGuardString() ?? "")",
        ]
    }

    public static func fromResponse(_ data: HttpResponse) -> [String: Any?] {
        return [
            DataName.CODE: data.code,
            DataName.MESSAGE: data.message,
            DataName.HEADERS: data.headers,
            DataName.BODY: "\(data.body?.toJsonGuardString() ?? "")",
        ]
    }

    public static func fromFetchProductsResult(_ result: AffiseResult<AffiseProductsResult>) -> [String: Any?] {
        return fromResult(result, fromAffiseProductsResult)
    }

    public static func fromPurchaseResult(_ result: AffiseResult<AffisePurchasedInfo>) -> [String: Any?] {
        return fromResult(result, fromAffisePurchasedInfo)
    }

    private static func fromResult<T>(_ result: AffiseResult<T>, _ transform: (T) -> [String: Any?]?) -> [String: Any?] {
        var map: [String: Any?] = [:]

        switch result {
        case let .failure(error):
            map[DataName.ERROR] = "\(error)"

        case let .success(result):
            map[DataName.SUCCESS] = transform(result)
        }

        return map
    }

    private static func fromAffiseProductsResult(_ data: AffiseProductsResult) -> [String: Any?] {
        return [
            DataName.PRODUCTS: fromProductsList(data.products),
            DataName.INVALID_IDS: data.invalidIds,
        ]
    }

    private static func fromAffisePurchasedInfo(_ data: AffisePurchasedInfo) -> [String: Any?] {
        return [
            DataName.PRODUCT: fromProduct(data.product),
            DataName.ORDER_ID: data.orderId,
            DataName.ORIGINAL_ORDER_ID: data.originalOrderId,
//            DataName.PURCHASE: data.purchase,
        ]
    }

    private static func fromProductsList(_ products: [AffiseProduct]) -> [[String: Any?]] {
        return products.compactMap { fromProduct($0) }
    }

    private static func fromProduct(_ product: AffiseProduct?) -> [String: Any?]? {
        guard let product = product else { return nil }
        return [
            DataName.PRODUCT_ID: product.productId,
            DataName.TITLE: product.title,
            DataName.DESCRIPTION: product.productDescription,
            DataName.PRODUCT_TYPE: product.productType?.enumValue,
            DataName.PRICE: fromPrice(product.price),
            DataName.SUBSCRIPTION: fromSubscription(product.subscription),
//            DataName.PRODUCT_DETAILS: product.productDetails,
        ]
    }
    
    private static func fromPrice(_ price: AffiseProductPrice?) -> [String: Any?]? {
        guard let price = price else {
            return nil
        }

        return [
            DataName.VALUE: NSDecimalNumber(decimal: price.value).doubleValue,
            DataName.CURRENCY_CODE: price.currencyCode,
            DataName.FORMATTED_PRICE: price.formattedPrice,
        ]
    }
    
    private static func fromSubscription(_ subscription: AffiseProductSubscriptionDetail?) -> [String: Any?]? {
        guard let subscription = subscription else {
            return nil
        }

        return [
            DataName.OFFER_ID: subscription.offerId,
            DataName.TIME_UNIT: subscription.timeUnit.enumValue,
            DataName.NUMBER_OF_UNITS: subscription.numberOfUnits,
        ]
    }
    
    static func toAffiseProduct(_ data: [String: Any?]?) -> AffiseProduct?  {
        guard let data = data else {
            return nil
        }

        guard let productId: String = data.opt(DataName.PRODUCT_ID) else { return nil }
        guard let title: String = data.opt(DataName.TITLE) else { return nil }
        guard let description: String = data.opt(DataName.DESCRIPTION) else { return nil }
        guard let productType: String = data.opt(DataName.PRODUCT_TYPE) else { return nil }
        let price: [String: Any?]? = data.opt(DataName.PRICE)
        let subscription: [String: Any?]? = data.opt(DataName.SUBSCRIPTION)
        let productDetails: String? = data.opt(DataName.PRODUCT_DETAILS)

        return AffiseProduct(
            productId: productId,
            title: title,
            productDescription: description,
            productType: toAffiseProductType(productType) ?? AffiseProductType.CONSUMABLE,
            price: toPrice(price),
            subscription: toSubscription(subscription),
            productDetails: productDetails
        )
    }
    
    private static func toPrice(_ data: [String: Any?]?) -> AffiseProductPrice? {
        guard let map = data else {
            return nil
        }

        guard let value: NSNumber = map.opt(DataName.VALUE) else { return nil }
        guard let currencyCode: String = map.opt(DataName.CURRENCY_CODE) else { return nil }
        guard let formattedPrice: String = map.opt(DataName.FORMATTED_PRICE) else { return nil }

        return AffiseProductPrice(
            value: value.decimalValue,
            currencyCode: currencyCode,
            formattedPrice: formattedPrice
        )
    }
    
    private static func toSubscription(_ data: [String: Any?]?) -> AffiseProductSubscriptionDetail? {
        guard let map = data else {
            return nil
        }

        let offerId: String? = map.opt(DataName.OFFER_ID)
        guard let numberOfUnits: NSNumber = map.opt(DataName.NUMBER_OF_UNITS) else { return nil }
        guard let timeUnit: TimeUnitType = TimeUnitType.from(map.opt(DataName.TIME_UNIT)) else { return nil }
        
        return AffiseProductSubscriptionDetail(
            offerId: offerId,
            timeUnit: timeUnit,
            numberOfUnits: numberOfUnits.intValue
        )
    }

    static func toAffiseProductType(_ name: String?) -> AffiseProductType? {
        return AffiseProductType.from(name)
    }
}
