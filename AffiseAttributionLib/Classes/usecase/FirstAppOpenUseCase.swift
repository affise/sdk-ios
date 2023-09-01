//
//  FirstAppOpenUseCase.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation


internal class FirstAppOpenUseCase {
    
    private let FIRST_OPENED = "FIRST_OPENED"
    private let FIRST_OPENED_DATE_KEY = "FIRST_OPENED_DATE_KEY"
    private let AFF_DEVICE_ID = "AFF_DEVICE_ID"
    private let AFF_ALT_DEVICE_ID = "AFF_ALT_DEVICE_ID"
    
    private let preferences: UserDefaults
    
    init(preferences: UserDefaults) {
        self.preferences = preferences
    }

    /**
     * Check preferences for have first opened date and generate properties if no data
     */
    func onAppCreated() {
        if (preferences.value(forKey: FIRST_OPENED_DATE_KEY) == nil) {
            onAppFirstOpen()
        }
    }

    /**
     * Generate properties on app first open
     */
    private func onAppFirstOpen() {
        //Create first open date
        let firstOpenDate = Date().timeIntervalSince1970

        //Create affDevId
        let affDevId = generateUUID().uuidString.lowercased()

        //Create affAltDevId
        let affAltDevId = generateUUID().uuidString.lowercased()

        //Create randomUserId
        let randomUserId = generateUUID().uuidString.lowercased()

        //Save properties
        preferences.set(firstOpenDate, forKey: FIRST_OPENED_DATE_KEY)
        preferences.set(affDevId, forKey: AFF_DEVICE_ID)
        preferences.set(affAltDevId, forKey: AFF_ALT_DEVICE_ID)
        preferences.set(randomUserId, forKey: Parameters.RANDOM_USER_ID)
        preferences.set(true, forKey: FIRST_OPENED)
    }

    /**
     * Get first open
     * @return is first open
     */
    func isFirstOpen() -> Bool? {
        guard let value = preferences.value(forKey: FIRST_OPENED) as? Bool else {
            return nil
        }
        
        if value {
            preferences.set(false, forKey: FIRST_OPENED)
        }
        
        return value
    }
    
    /**
     * Get first open date
     * @return first open date
     */
    func getFirstOpenDate() -> TimeInterval? {
        guard let value = preferences.value(forKey: FIRST_OPENED_DATE_KEY) as? Double else {
            return nil
        }
        
        return value
    }
    
    /**
     * Get devise id
     * @return devise id
     */
    func getAffiseDeviseId() -> String {
        return preferences.string(forKey: AFF_DEVICE_ID) ?? ""
    }
    
    /**
     * Get alt devise id
     * @return alt devise id
     */
    func getAffiseAltDeviseId() -> String  {return preferences.string(forKey: AFF_ALT_DEVICE_ID) ?? ""}
    
    /**
     * Get random user id
     * @return random user id
     */
    func getRandomUserId() -> String  {return preferences.string(forKey: Parameters.RANDOM_USER_ID) ?? ""}
}
