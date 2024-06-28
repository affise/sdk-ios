import Foundation


public func isHttpValid(_ responseCode: Int) -> Bool {
    return (200...399).contains(responseCode)
}


public func isRedirect(_ responseCode: Int) -> Bool {
    return (300...399).contains(responseCode)
}


extension HttpResponse {
    public func isHttpValid() -> Bool {
        return AffiseAttributionLib.isHttpValid(self.code)
    }
    
    
    public func isRedirect() -> Bool {
        return AffiseAttributionLib.isRedirect(self.code)
    }
}


extension HTTPURLResponse {
    func allHeaders() -> [String: [String]] {
        return Dictionary(uniqueKeysWithValues: self.allHeaderFields.map { k, v in
            let key = String(describing: k)
            var value = ""
            if #available(iOS 13.0, *) {
                value = self.value(forHTTPHeaderField: key) ?? ""
            } else {
                value = String(describing: v)
            }
            return ( key, value.components(separatedBy: "; ") )
        })
    }
}

