public class PredefinedGroup {
    
    static let NAME: String = "\(PredefinedConstants.PREFIX)list_group"

    private(set) var predefinedParameters: [(String, Any?)] = []

    public func addPredefinedParameter(_ parameter: PredefinedString, string: String) -> PredefinedGroup {
        predefinedParameters.append((parameter.value(), string))
        return self
    }

    public func addPredefinedParameter(_ parameter: PredefinedLong, long: Int64) -> PredefinedGroup {
        predefinedParameters.append((parameter.value(), long))
        return self
    }
    
    public func addPredefinedParameter(_ parameter: PredefinedFloat, float: Float) -> PredefinedGroup {
        predefinedParameters.append((parameter.value(), float))
        return self
    }
}
