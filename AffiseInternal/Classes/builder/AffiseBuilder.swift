import AffiseAttributionLib
internal class AffiseBuilder {
    func call(_ api: AffiseApiMethod, _ map: [String: Any?], _ result: AffiseResult?) {
        guard let data: [String: Any?] = map.opt(api) else {
            result?.error("api [\(api.method)]: builder data not set")
            return
        }
        
        guard let nameRaw: String = data.opt(AffiseBuilderProperty.BUILDER_NAME) else {
            result?.error("api [\(api.method)]: builder name not set")
            return
        }
        
        guard let name: AffiseBuilderName = AffiseBuilderName.from(nameRaw) else {
            result?.error("api [\(api.method)]: builder name not found")
            return
        }
        
        callBuilder(name, map, result)
    }

    func callBuilder(_ name: AffiseBuilderName, _ map: [String: Any?], _ result: AffiseResult?) {
        switch name {
        case .AD_REVENUE: callAdRevenu(name, map, result)
//        default:
//            result?.notImplemented()
        }
    }
    
    private func callAdRevenu(_ name: AffiseBuilderName, _ map: [String: Any?], _ result: AffiseResult?) {
        let sourceRaw: String? = map.opt(AffiseBuilderProperty.SOURCE)
        guard let source: AffiseAdSource = AffiseAdSource.from(sourceRaw) else {
            result?.error("api [\(name.method)]: no valid source \(sourceRaw ?? "")")
            return
        }
        
        let adRevenue = AffiseAdRevenue(source)
                
        guard let revenue: NSNumber = map.opt(AffiseBuilderProperty.REVENUE) else {
//            result?.error("api [\(name.method)]: revenue not set")
            return
        }
        
        let currency: String? = map.opt(AffiseBuilderProperty.CURRENCY)
        
        let _ = adRevenue.setRevenue(revenue.doubleValue, currency ?? "")
        
        if let network: String = map.opt(AffiseBuilderProperty.NETWORK) {
            let _ = adRevenue.setNetwork(network)
        }
        
        if let unit: String = map.opt(AffiseBuilderProperty.UNIT) {
            let _ = adRevenue.setUnit(unit)
        }
        
        if let placement: String = map.opt(AffiseBuilderProperty.PLACEMENT) {
            let _ = adRevenue.setPlacement(placement)
        }
        
        adRevenue.send()
        
        result?.success(nil)
    }
}
