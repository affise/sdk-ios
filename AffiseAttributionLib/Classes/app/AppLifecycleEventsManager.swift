//
//  AppLifecycleEventsManager.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Triggered when a new has received event
 */
typealias AppLifecycleCallback = (_ userInfo: [AnyHashable : Any]?) throws -> Void


protocol AppLifecycleEventsManager {
    func addFinishLaunchingListener(_ listener: @escaping AppLifecycleCallback)
    
    /**
     * Add [listener] for the app becomes active
     */
    func addDidBecomeActiveListener(_ listener: @escaping AppLifecycleCallback)
    
    /**
     * Add [listener] for the app enters the background
     */
    func addDidEnterBackgroundListener(_ listener: @escaping AppLifecycleCallback)
    
    /**
     * Add [listener] for the app is entering the foreground
     */
    func addWillEnterForegroundListener(_ listener: @escaping AppLifecycleCallback)
    
    /**
     * Add [listener] for app is no longer active
     */
    func addWillResignActiveListener(_ listener: @escaping AppLifecycleCallback)
    
    /**
     * Add [listener] for app is about to terminate
     */
    func addWillTerminateListener(_ listener: @escaping AppLifecycleCallback)
    
    /**
     * @return current background status
     */
    var isBackground: Bool { get }
}
