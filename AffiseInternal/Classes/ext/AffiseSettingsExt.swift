import AffiseAttributionLib


internal class Field {
    static let AFFISE_APP_ID = "affiseAppId"
    static let SECRET_KEY = "secretKey"
    static let PART_PARAM_NAME = "partParamName"
    static let PART_PARAM_NAME_TOKEN = "partParamNameToken"
    static let APP_TOKEN = "appToken"
    // static let AUTO_CATCHING_CLICK_EVENTS = "autoCatchingClickEvents"
    static let IS_PRODUCTION = "isProduction"
    // static let ENABLED_METRICS = "enabledMetrics"
     static let DOMAIN = "domain"
}

internal extension Dictionary where Key == String, Value == Any? {

    func getString(_ key: String) -> String? {
        return self[key] as? String
    }
    
    func getBool(_ key: String) -> Bool? {
        return self[key] as? Bool
    }
    
    func isValid() -> Bool {
        guard let affiseAppId = self.getString(Field.AFFISE_APP_ID) else { return false }
        if affiseAppId.isEmpty { return false }
        guard let secretKey = self.getString(Field.SECRET_KEY) else { return false }
        if secretKey.isEmpty { return false }
        
        return true
    }
    
    func getAppIdAndSecretKey() -> (String, String) {
        return (self.getString(Field.AFFISE_APP_ID) ?? "", self.getString(Field.SECRET_KEY) ?? "")
    }
}

internal extension AffiseSettings {
    func addSettings(_ data: [String: Any?]) -> AffiseSettings {
        if let value = data.getString(Field.DOMAIN) {
            self.setDomain(value)
        }
        
        if let value = data.getBool(Field.IS_PRODUCTION) {
            self.setProduction(value)
        }
        
        if let value = data.getString(Field.PART_PARAM_NAME) {
            self.setPartParamName(value)
        }
        
        if let value = data.getString(Field.PART_PARAM_NAME_TOKEN) {
            self.setPartParamNameToken(value)
        }
        
        if let value = data.getString(Field.APP_TOKEN) {
            self.setAppToken(value)
        }
        
        return self
    }
}
