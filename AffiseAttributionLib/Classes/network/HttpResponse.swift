import Foundation

@objc
public class HttpResponse: NSObject {
    public let code: Int
    public let message: String
    public let body: String?

    public init(_ code: Int, _ message: String, _ body: String? = nil) {
        self.code = code
        self.message = message
        self.body = body
    }
    
    public override var description: String {
        return "HttpResponse(code=\(code), message=\(message), body=\(body ?? ""))"
    }
}
