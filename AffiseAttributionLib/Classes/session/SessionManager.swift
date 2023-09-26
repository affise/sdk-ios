//
//  SessionManager.swift
//  app
//
//  Created by Sergey Korney
//


/**
 * Manager Session interface
 */
protocol SessionManager {
    
    func initialize()

    /**
     * Get session active status
     *
     * @return session is active or not
     */
    func isSessionActive()->Bool

    /**
     * Get last interaction time
     *
     * @return Last interaction time
     */
    func getLastInteractionTime()->TimeInterval?

    /**
     * Get session time
     *
     * @return session time
     */
    func getSessionTime()->TimeInterval

    /**
     * Get lifetime session time
     *
     * @return lifetime session time
     */
    func getLifetimeSessionTime()->TimeInterval

    /**
     * Get session count
     *
     * @return session count
     */
    func getSessionCount()->Int64

    func sessionStart()
}
