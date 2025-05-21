import AffiseAttributionLib

internal extension Dictionary where Key == String, Value == Any? {

    func getEventParameters() -> [(String, Any?)] {
        guard let value: [String: Any?] = self[Parameters.AFFISE_PARAMETERS] as? [String: Any?] else {
            return []
        }
        return value.toArray()
    }
    
    func getEventName() -> String? {
        return self[Parameters.AFFISE_EVENT_NAME] as? String
    }
    
    func getUserData() -> String? {
        return self[Parameters.AFFISE_EVENT_USER_DATA] as? String
    }
    
    func getCategory() -> String? {
        return self[Parameters.AFFISE_EVENT_CATEGORY] as? String
    }
    
    func getEventData() -> [String: Any?] {
        guard let value: [String: Any?] = self[Parameters.AFFISE_EVENT_DATA] as? [String: Any?] else {
            return [:]
        }
        return value
    }
    
    func getTimeStamp() -> Int64? {
        let value: Int64? = self.getPropertyByKey(AffiseProperty.TIMESTAMP.rawValue)
        return value
    }
    
    func getSubType() -> String? {
        let value :String? = self.getPropertyByName(SubscriptionParameters.AFFISE_SUBSCRIPTION_EVENT_TYPE_KEY.rawValue)
        return value
    }
    
    func getSerializeObjectOrNull(_ key: String? = nil) -> [(String, Any?)]? {
        let value: [String: Any?]? = self.getPropertyByKey(key)
        return value?.toArray()
    }
    
    func getSerializeObject(_ key: String? = nil) -> [(String, Any?)] {
        return self.getSerializeObjectOrNull(key) ?? []
    }
    
    func getSerializeString(_ key: String? = nil) -> String {
        let value: String = self.getPropertyByKey(key) ?? ""
        return value
    }
    
    func getSerializeLong(_ key: String? = nil) -> Int64 {
        let value: Int64 = self.getPropertyByKey(key) ?? 0
        return value
    }
    
    func getSerializeBool(_ key: String? = nil) -> Bool {
        let value: Bool = self.getPropertyByKey(key) ?? false
        return value
    }

    func getSerializeArrayOfAny() -> [Any] {
        return self.getArrayOfAny().toArrayOfAny()
    }
    
    func getSerializeArrayOfObject() -> [[(String, Any?)]] {
        return self.getArrayOfAny().toArrayOfObject()
    }
        
    func getPropertyByKey<T>(_ key: String? = nil) -> T? {
        guard let key = self.getEventName()?.toAffiseEventProperty(key) else {
            return nil
        }
        let value: [String: Any?] = getEventData()
        return value[key] as? T
    }
    
    private func getArrayOfAny(_ key: String? = nil) -> [Any] {
        let value: [Any] = self.getPropertyByKey(key) ?? []
        return value
    }
    
    private func getPropertyByName<T>(_ name: String?) -> T? {
        guard let key = name else {
            return nil
        }
        let value: [String: Any?] = getEventData()
        return value[key] as? T
    }
    
    mutating func removeSubtypeFields(_ eventName: String? ) -> [String: Any?] {
        self.removeValue(forKey: SubscriptionParameters.AFFISE_SUBSCRIPTION_EVENT_TYPE_KEY.rawValue)
        
        if let keyTimestamp = eventName?.toAffiseEventProperty(AffiseProperty.TIMESTAMP.rawValue) {
            self.removeValue(forKey: keyTimestamp)
        }
        
        return self
    }
}

internal let PROPERTY_PREFIX: String = "affise_event"

internal extension String {
    func toAffiseEventProperty(_ property: String? = nil) -> String {
        let name = toSnakeCase() ?? "NAME"
        
        guard let prop = property else {
            return "\(PROPERTY_PREFIX)_\(name)"
        }
        
        return "\(PROPERTY_PREFIX)_\(name)_\(prop)"
    }
}

internal extension Array where Element == Any {
    func toArrayOfAny() -> [Any]  {
        return self.map { value in
            if let subMap = value as? [String: Any?] {
                return subMap.toArray()
            }
            return value
        }
    }
    
    func toArrayOfObject() -> [[(String, Any?)]] {
        return self.map {
            guard let subMap: [String: Any?] = $0 as? [String: Any?] else {
                return []
            }
            return subMap.toArray()
        }
    }
}
