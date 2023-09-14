@objc
public enum AffiseAdSource: Int {

    case ADMOB
    case ADMOST
    case APPLOVIN_MAX
    case HELIUM_CHARTBOOST
    case IRONSOURCE
    
    public var type: String {
        switch self {
        case .ADMOB: return "admob"
        case .ADMOST: return "admost"
        case .APPLOVIN_MAX: return "applovin_max"
        case .HELIUM_CHARTBOOST: return "helium_chartboost"
        case .IRONSOURCE: return "ironsource"
        }
    }
}

extension AffiseAdSource: CaseIterable, CustomStringConvertible {
    
    public var description: String { type }
    
    public static func from(_ name: String?) -> AffiseAdSource? {
        if name == nil { return nil }
        return allCases.first { name == $0.type }
    }
}
