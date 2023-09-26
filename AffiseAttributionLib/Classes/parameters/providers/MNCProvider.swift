import CoreTelephony


/**
 * Provider for parameter [ProviderType.MNCODE]
 */
class MNCProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider

        // Get carrier name
        let carrierName = carrier?.mobileNetworkCode
        return carrierName
    }
    
    public override func getOrder() -> Float {
        37.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.MNCODE
    }
}
