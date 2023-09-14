import Foundation

internal class AffisePropertyBuilder {
    private let PREFIX = "affise_event"
    private var data: [(String, Any?)] = []
    private var name: String? = nil
    
    func new(_ name: String) -> AffisePropertyBuilder {
        self.name = name.toSnakeCase()
        return self
    }
    
    func new(_ name: String, value: Any?) -> AffisePropertyBuilder{
        let result = new(name)
        if (!name.isEmpty) {
            data.append((eventName(), value))
        }
        
        return result
    }
    
    @discardableResult
    func add(_ key: AffiseProperty, value: Any?) -> AffisePropertyBuilder {
        return add(key.rawValue, value: value)
    }
    
    @discardableResult
    func add(_ key: String, value: Any?) -> AffisePropertyBuilder {
        if (!key.isEmpty) {
            return addRaw(eventProperty(key), value: value)
        }
        return self
    }
    
    @discardableResult
    func addRaw(_ key: String, value: Any?) -> AffisePropertyBuilder {
        data.append((key,value))
        return self
    }
    
    func build() -> [(String, Any?)] {
        return data
    }
    
    private func eventName() -> String {
        return "\(PREFIX)_\(name ?? "")"
    }
    
    private func eventProperty(_ key: String) -> String {
        return "\(eventName())_\(key)"
    }
}
