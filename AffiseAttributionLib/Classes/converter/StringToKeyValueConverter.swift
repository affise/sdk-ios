public class StringToKeyValueConverter: Converter {
    
    private static let KEY = "key"
    private static let VALUE = "value"
    
    public typealias T = String?
    public typealias R = [AffiseKeyValue]
    
    public init() {}

    public func convert(from: String?) -> [AffiseKeyValue] {
        guard let json = from, !json.isEmpty else { return [] }
        var result: [AffiseKeyValue] = []
        
        do {
            let jsonArray = try JSONSerialization.jsonObject(with: json.data(using: .utf8)!, options: .mutableContainers) as! [[String:Any?]]
            for item in jsonArray {
                guard let key = item[StringToKeyValueConverter.KEY] as? String else { continue }
                let value = item[StringToKeyValueConverter.VALUE] as? String
                result.append(AffiseKeyValue(key, value))
            }
        } catch {
            debugPrint(error)
        }
        
        return result
    }
}
