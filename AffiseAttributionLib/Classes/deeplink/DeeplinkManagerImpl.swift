//
//  DeeplinkManagerImpl.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//


/**
 * Implementation for [DeeplinkManager]
 *
 * @property initProperties model to retrieve affise app id from
 * @property isDeeplinkRepository repository that stores isDeeplinkClick property, used by [DeeplinkClickPropertyProvider]
 * @property activityActionsManager listeners for changes activity
 */
internal class DeeplinkManagerImpl : DeeplinkManager {
    
    private let isDeeplinkRepository: DeeplinkClickRepository
    private let appLifecycleEventsManager: AppLifecycleEventsManager
    
    init(isDeeplinkRepository: DeeplinkClickRepository, appLifecycleEventsManager: AppLifecycleEventsManager) {
        self.isDeeplinkRepository = isDeeplinkRepository
        self.appLifecycleEventsManager = appLifecycleEventsManager
    }

    /**
     * Listener for resume activities
     */
    private var onFinishLaunchingSubscription: AppLifecycleCallback? = nil

    /**
     * Callback that is going to be triggered when deeplink is received by application
     */
    private var deeplinkCallback: OnDeeplinkCallback? = nil

    func initialize(launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        if let url = launchOptions?[.url] as? URL {
            handleDeeplink(url: url)
        }
        
        //Check started listener
        if (onFinishLaunchingSubscription == nil) {
            //Create listener
            onFinishLaunchingSubscription = {  [weak self] userInfo in
                guard let self = self else {
                    return
                }
                
                if let url = userInfo?[UIApplication.LaunchOptionsKey.url] as? URL {
                    self.handleDeeplink(url: url)
                }
            }
            
            //Add listener
            appLifecycleEventsManager.addFinishLaunchingListener(onFinishLaunchingSubscription!)
        }
    }

    func setDeeplinkCallback(callback: @escaping OnDeeplinkCallback) {
        deeplinkCallback = callback
    }

    func handleDeeplink(url: URL) {
        isDeeplinkRepository.setDeeplinkClick(isDeeplink: true)
        isDeeplinkRepository.setDeeplink(deeplink: url.absoluteString)
        deeplinkCallback?(url)
    }
}
