//
//  InitPropertiesStorage.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation

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
     * Update secretId in Affise init properties
     */
    func updateSecretId(secretId: String)
}
