//
//  LogsManager.swift
//  app
//
//  Created by Sergey Korney
//


/**
 * Manager logs interface
 */
public protocol LogsManager {

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
