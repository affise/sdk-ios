internal enum AffiseBuilderProperty: String {
    case BUILDER_NAME = "builder_name"
    case SOURCE = "source"
    case REVENUE = "revenue"
    case CURRENCY = "currency"
    case NETWORK = "network"
    case UNIT = "unit"
    case PLACEMENT = "placement"
}

extension AffiseBuilderProperty {
    var type: String {
        rawValue
    }
}
