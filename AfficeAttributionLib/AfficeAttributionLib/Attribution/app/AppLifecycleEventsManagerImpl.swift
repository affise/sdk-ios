//
//  AppLifecycleEventsManagerImpl.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation
import UIKit

/**
 * Manager for handling events occurring on the activity
 *
 * @property app application on which they are listening Activities
 * @property logsManager for error logging
 */


class AppLifecycleEventsManagerImpl {
    private let notificationCenter: NotificationCenter
    private let logsManager: LogsManager
    
    private var didFinishLaunchingListeners: Array<AppLifecycleCallback> = []
    private var didBecomeActiveListeners: Array<AppLifecycleCallback> = []
    private var didEnterBackgroundListeners: Array<AppLifecycleCallback> = []
    private var willEnterForegroundListeners: Array<AppLifecycleCallback> = []
    private var willResignActiveListeners: Array<AppLifecycleCallback> = []
    private var willTerminateListeners: Array<AppLifecycleCallback> = []
    internal var isBackground = false

    init(notificationCenter: NotificationCenter,
         logsManager: LogsManager) {
        
        self.notificationCenter = notificationCenter
        self.logsManager = logsManager

        subscribeToNotifications()
    }
    
    private func subscribeToNotifications() {
        notificationCenter.addObserver(self,
                                       selector: #selector(onAppDidFinishLaunching),
                                       name: UIApplication.didFinishLaunchingNotification,
                                       object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(onAppDidBecomeActive),
                                       name: UIApplication.didBecomeActiveNotification,
                                       object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(onAppDidEnterBackground),
                                       name: UIApplication.didEnterBackgroundNotification,
                                       object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(onAppWillEnterForeground),
                                       name: UIApplication.willEnterForegroundNotification,
                                       object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(onAppWillResignActive),
                                       name: UIApplication.willResignActiveNotification,
                                       object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(onAppWillTerminate),
                                       name: UIApplication.willTerminateNotification,
                                       object: nil)
    }
    
    @objc func onAppDidFinishLaunching(notification: Notification) {
        do {
            try didFinishLaunchingListeners.forEach { callback in
                try callback(notification.userInfo)
            }
        } catch {
            logsManager.addSdkError(error: error)
        }
    }
    
    /**
     * Posted when the app becomes active.
     */
    @objc func onAppDidBecomeActive(notification: Notification) {
        do {
            try didBecomeActiveListeners.forEach { callback in
                try callback(notification.userInfo)
            }
        } catch {
            logsManager.addSdkError(error: error)
        }
    }

    /**
     * Posted when the app enters the background.
     */
    @objc func onAppDidEnterBackground(notification: Notification) {
        isBackground = true
        
        do {
            try didEnterBackgroundListeners.forEach { callback in
                try callback(notification.userInfo)
            }
        } catch {
            logsManager.addSdkError(error: error)
        }
    }
    
    /**
     * Posted when the app is entering the foreground.
     */
    @objc func onAppWillEnterForeground(notification: Notification) {
        isBackground = false
        
        do {
            try willEnterForegroundListeners.forEach { callback in
                try callback(notification.userInfo)
            }
        } catch {
            logsManager.addSdkError(error: error)
        }
    }
    
    /**
     * Posted when the app is no longer active.
     */
    @objc func onAppWillResignActive(notification: Notification) {
        do {
            try willResignActiveListeners.forEach { callback in
                try callback(notification.userInfo)
            }
        } catch {
            logsManager.addSdkError(error: error)
        }
    }
    
    /**
     * Posted when the app is about to terminate.
     */
    @objc func onAppWillTerminate(notification: Notification) {
        do {
            try willTerminateListeners.forEach { callback in
                try callback(notification.userInfo)
            }
        } catch {
            logsManager.addSdkError(error: error)
        }
    }
}


extension AppLifecycleEventsManagerImpl: AppLifecycleEventsManager {
    func addFinishLaunchingListener(_ listener: @escaping AppLifecycleCallback) {
        didFinishLaunchingListeners.append(listener)
    }
    
    func addDidBecomeActiveListener(_ listener: @escaping AppLifecycleCallback) {
        didBecomeActiveListeners.append(listener)
    }

    func addDidEnterBackgroundListener(_ listener: @escaping AppLifecycleCallback) {
        didEnterBackgroundListeners.append(listener)
    }
    
    func addWillEnterForegroundListener(_ listener: @escaping AppLifecycleCallback) {
        willEnterForegroundListeners.append(listener)
    }
    
    func addWillResignActiveListener(_ listener: @escaping AppLifecycleCallback) {
        willResignActiveListeners.append(listener)
    }
    
    func addWillTerminateListener(_ listener: @escaping AppLifecycleCallback) {
        willTerminateListeners.append(listener)
    }
}
