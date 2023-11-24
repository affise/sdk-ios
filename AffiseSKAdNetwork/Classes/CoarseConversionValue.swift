import Foundation

@objc
public class CoarseConversionValue: NSObject {

    @objc
    public static let high = CoarseValue("high")

    @objc
    public static let low = CoarseValue("low")

    @objc
    public static let medium = CoarseValue("medium")

    public static func raw(_ value: String) -> CoarseValue {
        return CoarseValue(value)
    }
}