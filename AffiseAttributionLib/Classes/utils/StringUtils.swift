import Foundation

public func isNullOrBlank(_ text: String?) -> Bool {
    guard let text = text else {
        return true
    }
    return text.isEmpty 
}

public extension Data {
    func toString() -> String? {
        return String.init(data: self, encoding: .utf8)
    }
}

public extension String {
    func toData() -> Data? {
        return self.data(using: .utf8)
    }
    
    func toURL() -> URL? {
        return Foundation.URL(string: self)
    }
    
    
    func toJsonGuardString() -> String {
        return self.replacingOccurrences(of: "\"", with: "\\\"")
    }
}
