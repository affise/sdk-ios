//
//  AppDelegate.swift
//  app
//
//  Created by Sergey Korney
//

import UIKit
import AffiseAttributionLib

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let properties = AffiseInitProperties(affiseAppId: "AffiseDemoApp",
                                              partParamName: "partParamName",
                                              partParamNameToken: "partParamNameToken",
                                              appToken: "app-token",
                                              isProduction: false,
                                              secretId: "be07d122-3f3c-11ec-9bbc-0242ac130002")
        Affise.shared.load(app: application, initProperties: properties, launchOptions: launchOptions)
        Affise.shared.registerDeeplinkCallback { url in
            let component = URLComponents(string: url.absoluteString)!
            let screen = component.queryItems?.first(where: {$0.name == "screen"})?.value
            if let screen = screen, screen == "special_offer" {
                // open special offer activity
            } else {
                // open another activity
            }
        }
        return true
    }
    
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        Affise.shared.handleDeeplink(url: url)
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

