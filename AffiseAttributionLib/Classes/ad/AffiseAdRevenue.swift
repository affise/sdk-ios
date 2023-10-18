@objc
public final class AffiseAdRevenue: NSObject {
    
    let event: Event

    public init(_ source: AffiseAdSource) {
        event = AdRevenueEvent()
            .addPredefinedParameter(.SOURCE, string: source.type)
    }
    
    public func setRevenue(_ revenue: Float, _ currency: String) -> AffiseAdRevenue {
        let _ = event
            .addPredefinedParameter(.REVENUE, float: revenue)
            .addPredefinedParameter(.CURRENCY, string: currency)
        return self
    }
    
    public func setRevenue(_ revenue: Double, _ currency: String) -> AffiseAdRevenue {
        let _ = event
            .addPredefinedParameter(.REVENUE, float: Float(revenue))
            .addPredefinedParameter(.CURRENCY, string: currency)
        return self
    }
    
    public func setNetwork(_ network: String?) -> AffiseAdRevenue {
        guard let value = network else { return self }
        let _ = event.addPredefinedParameter(.NETWORK, string: value)
        return self
    }
    
    public func setUnit(_ unit: String?) -> AffiseAdRevenue {
        guard let value = unit else { return self }
        let _ = event.addPredefinedParameter(.UNIT, string: value)
        return self
    }
    
    public func setPlacement(_ placement: String?) -> AffiseAdRevenue {
        guard let value = placement else { return self }
        let _ = event.addPredefinedParameter(.PLACEMENT, string: value)
        return self
    }
    
    public func send() {
        event.send()
    }
}
