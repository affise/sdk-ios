//
//  InitPropertiesStorageImpl.swift
//  app
//
//  Created by Sergey Korney
//


/**
 * Implementation for [InitPropertiesStorage]
 *
 */
class InitPropertiesStorageImpl {

    /**
     * AffiseInitProperties cached value
     */
    private var properties: AffiseInitProperties? = nil
}

extension InitPropertiesStorageImpl: InitPropertiesStorage {
    
    /**
     * Get Affise init properties
     *
     * @return Affise init properties
     */
    func getProperties() -> AffiseInitProperties? {
        return properties;
    }

    /**
     * Set Affise init properties
     */
    func setProperties(_ properties: AffiseInitProperties) {
        self.properties = properties
    }

    /**
     * Update SecretKey in Affise init properties
     */
    func updateSecretKey(secretKey: String) {
        if let properties = properties {
            self.properties = AffiseInitProperties(affiseAppId: properties.affiseAppId,
                                                   partParamName: properties.partParamName,
                                                   partParamNameToken: properties.partParamNameToken,
                                                   appToken: properties.appToken,
                                                   isProduction: properties.isProduction,
                                                   secretKey: secretKey)
        }
    }
}
