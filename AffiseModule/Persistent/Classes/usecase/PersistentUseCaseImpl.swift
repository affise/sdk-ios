import Foundation
import Security

class PersistentUseCaseImpl {
    
    private let TAG_PREFIX: String = "com.affise.persist"
    
    func tagData(_ tag: String) -> Data? {
        return "\(TAG_PREFIX).\(tag)".data(using: .utf8)
    }

    @discardableResult
    func setString(_ tag: String, _ value: String) -> Bool {
        if tag.isBlank { return false }
        
        let addQuery: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrApplicationTag as String: tagData(tag) as Any,
            kSecValueData as String: value.data(using: .utf8) as Any,
        ]
        
        let status = SecItemAdd(addQuery as CFDictionary, nil)
        
        guard status == errSecSuccess else {
            return false
        }
        
        return true
    }
    
    func getString(_ tag: String) -> String? {
        if tag.isBlank { return nil }
        
        let getQuery: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrApplicationTag as String: tagData(tag) as Any,
            kSecReturnData as String: true,
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(getQuery as CFDictionary, &item)
        
        guard status == errSecSuccess else {
            return nil
        }
        
        guard let data = item as? Data else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
}

extension PersistentUseCaseImpl: PersistentUseCase {
    
    func set(_ tag: String, _ value: String) -> Bool {
        return setString(tag, value)
    }
    
    func get(_ tag: String) -> String? {
        return getString(tag)
    }
    
    func getOrCreate(_ tag: String, _ value: String) -> String {
        guard let data = getString(tag) else {
            setString(tag, value)
            return value
        }
        return data
    }
}
