internal enum AffiseBuilderName: String {
    case AD_REVENUE = "ad_revenue"
}

extension AffiseBuilderName: CaseIterable {
    var method: String {
        rawValue
    }
    
    public static func from(_ name: String?) -> AffiseBuilderName? {
        if name == nil { return nil }
        return allCases.first { name == $0.method }
    }
}
