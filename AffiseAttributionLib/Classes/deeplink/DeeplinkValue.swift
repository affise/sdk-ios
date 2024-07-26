import Foundation


@objc
public class DeeplinkValue: NSObject {
    
    public let deeplink: String
    public let scheme: String?
    public let host: String?
    public let path: String?
    public let parameters: [String:[String]]
    
    public init(
        deeplink: String,
        scheme: String?,
        host: String?,
        path: String?,
        parameters: [String:[String]]
    ) {
        self.deeplink = deeplink
        self.scheme = scheme
        self.host = host
        self.path = path
        self.parameters = parameters
    }
}

extension DeeplinkValue {
    public override var description: String { "DeeplinkValue(scheme=\"\(self.scheme ?? "")\", host=\"\(self.host ?? "")\", path=\"\(self.path ?? "")\", parameters=\(self.parameters))" }
}


extension Optional where Wrapped == URL {
    
    public func toDeeplinkValue() -> DeeplinkValue {
        guard let self = self else {
            return DeeplinkValue(
                deeplink: "",
                scheme: nil,
                host: nil,
                path: nil,
                parameters: [:]
            )
        }
        
        var host: String?
        var path: String?
        var parameters: [String:[String]] = [:]
        
        if #available(iOS 16.0, *) {
#if swift(>=5.7.1)
            host = self.host(percentEncoded: false)
            path = self.path(percentEncoded: false)
#else
            host = self.host
            path = self.path
#endif
        } else {
            host = self.host
            path = self.path
        }
        
        let component = URLComponents(string: self.absoluteString)
        for item in component?.queryItems ?? [] {
            let value = item.value?.removingPercentEncoding
            if parameters[item.name] != nil {
                parameters[item.name]?.append(value ?? "")
            } else {
                parameters[item.name] = [value ?? ""]
            }
        }
        
        return DeeplinkValue(
            deeplink: self.absoluteString,
            scheme: self.scheme,
            host: host,
            path: path,
            parameters: parameters
        )
    }
}
