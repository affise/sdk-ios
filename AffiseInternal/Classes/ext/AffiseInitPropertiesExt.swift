import AffiseAttributionLib

internal extension Dictionary where Key == String, Value == Any? {
    class Keys {
        static let FIELD_AFFISE_APP_ID = "affiseAppId"
        static let FIELD_PART_PARAM_NAME = "partParamName"
        static let FIELD_PART_PARAM_NAME_TOKEN = "partParamNameToken"
        static let FIELD_APP_TOKEN = "appToken"
        static let FIELD_SECRET_ID = "secretId"
        // static let FIELD_AUTO_CATCHING_CLICK_EVENTS = "autoCatchingClickEvents"
        static let FIELD_IS_PRODUCTION = "isProduction"
        // static let FIELD_ENABLED_METRICS = "enabledMetrics"
    }

    var toAffiseInitProperties: AffiseInitProperties {
        let map = self

        return AffiseInitProperties(
            affiseAppId: map[Keys.FIELD_AFFISE_APP_ID] as? String,
            partParamName: map[Keys.FIELD_PART_PARAM_NAME] as? String,
            partParamNameToken: map[Keys.FIELD_PART_PARAM_NAME_TOKEN] as? String,
            appToken: map[Keys.FIELD_APP_TOKEN] as? String,
            isProduction: map[Keys.FIELD_IS_PRODUCTION] as? Bool ?? false,
            secretKey: map[Keys.FIELD_SECRET_ID] as? String
        )
    }
}
