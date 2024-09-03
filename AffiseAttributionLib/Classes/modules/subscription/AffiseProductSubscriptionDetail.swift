import Foundation


@objc
public class AffiseProductSubscriptionDetail: NSObject {
//    public internal(set) var offerToken: String
    public internal(set) var offerId: String?
    public internal(set) var timeUnit: TimeUnitType
    public internal(set) var numberOfUnits: Int
    
    public init(
        offerId: String? = nil,
        timeUnit: TimeUnitType,
        numberOfUnits: Int
    ) {
        self.offerId = offerId
        self.timeUnit = timeUnit
        self.numberOfUnits = numberOfUnits
    }

    public override var description: String {
        "AffiseProductSubscriptionDetail(offerId=\"\(offerId ?? "")\", timeUnit=\"\(timeUnit)\", numberOfUnits=\"\(numberOfUnits)\")"
    }
}
