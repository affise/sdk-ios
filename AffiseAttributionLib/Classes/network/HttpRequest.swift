import Foundation

@objc
public class HttpRequest: NSObject {
    public let url: URL
    public let method: NetworkServiceMethod
    public let headers: [String: String]
    public let body: String?

    public init(_ url: URL, _ method: NetworkServiceMethod, _ headers: [String: String], _ body: String? = nil) {
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
    }
    
    public override var description: String {
        return "HttpRequest(url=\(url.absoluteString), method=\(method), headers=\(headers), body=\(body ?? ""))"
    }
}
