//
//  LogsManager.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation

/**
 * Manager logs interface
 */
protocol LogsManager {

    /**
     * Add [throwable] of network
     */
    func addNetworkError(error: Error)

    /**
     * Add [throwable] of device
     */
    func addDeviceError(error: Error)

    /**
     * Add [throwable] of user
     */
    func addUserError(error: Error)

    /**
     * Add [throwable] of sdk
     */
    func addSdkError(error: Error)

    /**
     * Add [message] error of device
     */
    func addDeviceError(message: String)
}
