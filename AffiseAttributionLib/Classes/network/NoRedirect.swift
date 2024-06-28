import Foundation


internal class NoRedirect: NSObject, URLSessionTaskDelegate, @unchecked Sendable {
        
    private static let shared: NoRedirect = NoRedirect()
    
    static let urlSession: URLSession = shared.session
    
    private var session: URLSession = URLSession.shared
        
    private override init() {
        super.init()
        self.session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
    }
    
    // URLSessionTaskDelegate method to handle redirection
    func urlSession(
        _ session: URLSession,
        task: URLSessionTask,
        willPerformHTTPRedirection response: HTTPURLResponse,
        newRequest request: URLRequest,
        completionHandler: @escaping (URLRequest?) -> Void
    ) {
        // Call the completion handler with nil to prevent the redirection from happening
        completionHandler(nil)
    }
}


internal extension URLSession {
    func dataTask(redirect: Bool, with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        if redirect == true {
            return self.dataTask(with: request, completionHandler: completionHandler)
        } else {
            return NoRedirect.urlSession.dataTask(with: request, completionHandler: completionHandler)
        }
    }
}
