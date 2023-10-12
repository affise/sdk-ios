import AffiseAttributionLib


public class ProvidersToJsonStringConverter: Converter {

    public typealias T = [Provider]
    public typealias R = String
    
    public func convert(from: [Provider]) -> String {
        let result = from.mapProviders().map {(key, value) in
            (key.provider, value)
        } 
        return "[\(result.jsonString())]"
    }
}
