//
//  SessionManagerImpl.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation


class SessionManagerImpl {
    
    static let TIME_TO_START_SESSION: TimeInterval = 15

    private let preferences: UserDefaults
    private let appLifecycleEventsManager: AppLifecycleEventsManager
    
    init(preferences: UserDefaults,
         appLifecycleEventsManager: AppLifecycleEventsManager) {
        
        self.preferences = preferences
        self.appLifecycleEventsManager = appLifecycleEventsManager
    }
    
    /**
     * Time of start session
     */
    private var openAppTime: TimeInterval? = nil

    /**
     * Last time of user active
     */
    private var closeAppTime: TimeInterval? = nil

    /**
     * Session active status
     */
    private var sessionActive: Bool = false

    /**
     * Open app status
     */
    private var isOpenApp: Bool = false

    /**
     * Subscribe to change open activity count
     */
    private func subscribeToActivityEvents() {
        
        //App is open
        self.isOpenApp = true
        
        /**
         * Check create open app time
         */
        if (self.openAppTime == nil) {
            //open app time
            self.openAppTime = Date().timeIntervalSince1970
        }
        
        appLifecycleEventsManager.addDidEnterBackgroundListener { [weak self] userInfo in
            guard let self = self else {
                return
            }
            //Update session status if need
            self.checkSessionToStart()
            
            //Save time of user quit or hide app
            self.closeAppTime = Date().timeIntervalSince1970
            
            //App is close
            self.isOpenApp = false
            
            //Drop session status
            self.sessionActive = false
            
            //Save sessionTime
            self.saveSessionTime()
            
            //Drop open app time
            self.openAppTime = nil
        }
        
        appLifecycleEventsManager.addWillEnterForegroundListener { [weak self] userInfo in
            guard let self = self else {
                return
            }
            //App is open
            self.isOpenApp = true
            
            /**
             * Check create open app time
             */
            if (self.openAppTime == nil) {
                //open app time
                self.openAppTime = Date().timeIntervalSince1970
            }
        }
    }

    /**
     * Check time of start app and start session
     */
    private func checkSessionToStart() {
        if sessionActive {
            return
        }
        
        //Check open app time
        if let startTime = openAppTime {
            //Time current session
            let time = Date().timeIntervalSince1970 - startTime - SessionManagerImpl.TIME_TO_START_SESSION
            
            //if session started
            if (time > 0) {
                sessionActive = true
                
                //Save new session
                addNewSession()
            }
        }
    }

    /**
     * Save session time
     */
    private func saveSessionTime() {
        preferences.set(getLifetimeSessionTime(), forKey: Parameters.LIFETIME_SESSION_COUNT)
    }

    /**
     * Get all old sessions time
     */
    private func getSaveSessionsTime() -> TimeInterval {
        preferences.value(forKey: Parameters.LIFETIME_SESSION_COUNT) as? TimeInterval ?? 0
    }

    /**
     * Save new session count
     */
    private func addNewSession() {
        let count = preferences.integer(forKey: Parameters.AFFISE_SESSION_COUNT)
        preferences.set(count + 1, forKey: Parameters.AFFISE_SESSION_COUNT)
    }
}


extension SessionManagerImpl: SessionManager {
    
    func initialize() {
        subscribeToActivityEvents()
    }
    
    
    func isSessionActive() -> Bool {
        //Check session status
        checkSessionToStart()
        
        //Return session status
        return sessionActive
    }
    
    func getLastInteractionTime() -> TimeInterval? {
        //Current time if app is open
        if (isOpenApp) {
            return Date().timeIntervalSince1970
        } else {
            //lastInteractionTime is session is active
            return closeAppTime
        }
    }
    
    func getSessionTime() -> TimeInterval {
        if let openAppTime = openAppTime{
            return Date().timeIntervalSince1970 - openAppTime
        } else {
            return 0
        }
    }
    
    func getLifetimeSessionTime() -> TimeInterval {
        return getSaveSessionsTime() + getSessionTime()
    }
    
    func getSessionCount() -> Int64 {
        //Check session status
        if (!sessionActive) {
            checkSessionToStart()
        }

        return Int64(preferences.integer(forKey: Parameters.AFFISE_SESSION_COUNT))
    }
}
