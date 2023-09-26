//
//  InitPropertiesStorage.swift
//
//  Created by Sergey Korney
//

/**
 * Storage for initiative sdk property
 */
protocol InitPropertiesStorage {

    /**
     * Get Affise init properties
     *
     * @return Affise init properties
     */
    func getProperties() -> AffiseInitProperties?

    /**
     * Set Affise init properties
     */
    func setProperties(_ properties: AffiseInitProperties)

    /**
     * Update secretKey in Affise init properties
     */
    func updateSecretKey(secretKey: String)
}
