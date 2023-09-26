import CoreTelephony


/**
 * Provider for parameter [ProviderType.ISP]
 */
class IspNameProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider

        // Get carrier name
        let carrierName = carrier?.carrierName
        return carrierName
    }
    
    public override func getOrder() -> Float {
        37.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.ISP
    }
}
