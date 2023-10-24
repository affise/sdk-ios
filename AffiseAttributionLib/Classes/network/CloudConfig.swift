public struct CloudConfig {
    
    static internal let defaultDomain: String = "https://tracking.affattr.com/"
    static private let path: String = "postback"
    
    static private var domain: String = defaultDomain
    
    /**
     * Urls for send data
     */
    static public private(set) var urls: [String] = [
        "\(domain)\(path)"
    ]

    static public let headers: [String:String] = [
         "Content-Type" : "application/json; charset=utf-8"
    ]
    
    static internal func setupDomain(_ domain: String?) {
        guard let domain = domain else { return }
        if domain.isEmpty { return }
        
        if domain.hasSuffix("/") {
            self.domain = domain
        } else {
            self.domain = "\(domain)/"
        }
        
        self.urls = [
            getURL(path)
        ]
    }
    
    static public func getURL(_ path: String) -> String {
        return "\(domain)\(path)"
    }
}
