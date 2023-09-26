import CoreTelephony


/**
 * Provider for parameter [ProviderType.MCCODE]
 */
class MCCProvider: StringPropertyProvider {
    
    override func provide() -> String? {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider

        // Get carrier name
        let carrierName = carrier?.mobileCountryCode
        return carrierName
    }
    
    public override func getOrder() -> Float {
        36.0
    }

    public override func getKey() -> ProviderType? {
        ProviderType.MCCODE
    }
}
