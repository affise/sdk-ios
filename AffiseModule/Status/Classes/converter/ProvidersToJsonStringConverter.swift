import AffiseAttributionLib


class ProvidersToJsonStringConverter: Converter {

    typealias T = [Provider]
    typealias R = String
    
    func convert(from: [Provider]) -> String {       
        let result = from.mapProviders().map {(key, value) in
            (key.provider, value)
        } 
        return "[\(result.jsonString())]"
    }
}
