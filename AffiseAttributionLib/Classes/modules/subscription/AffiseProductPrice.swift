import Foundation

@objc
public class AffiseProductPrice: NSObject {
    public internal(set) var value: Decimal
    public internal(set) var currencyCode: String
    public internal(set) var formattedPrice: String

    public internal(set) var locale: Locale = Locale.current

    public init(
        value: Decimal,
        currencyCode: String,
        formattedPrice: String
    ) {
        self.value = value 
        self.currencyCode = currencyCode
        self.formattedPrice = formattedPrice
    }

    public convenience init(
        value: Decimal,
        priceLocale: Locale? = Locale.current
    ) {
        let locale = priceLocale ?? Locale.current

        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .currency
        
        let currencyCode = locale.currencyCode ?? ""
        
        // if #available(iOS 16, *) {
        //    currencyCode = locale.currency?.identifier ?? "" // TODO
        // }

        self.init(
            value: value,
            currencyCode: currencyCode,
            formattedPrice: formatter.string(from: NSDecimalNumber(decimal: value)) ?? "\(value) \(currencyCode)"
        )
    }
    
    public override var description: String {
        "AffiseProductPrice(value=\"\(value)\", currencyCode=\"\(currencyCode)\", formattedPrice=\"\(formattedPrice)\")"
    }
}
