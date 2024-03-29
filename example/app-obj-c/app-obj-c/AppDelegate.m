//
//  AppDelegate.m
//  app-obj-c
//
//  Created by Sergey Korney
//

#import "AppDelegate.h"
#import <AffiseAttributionLib/AffiseAttributionLib-Swift.h>
#import <AffiseSKAdNetwork/AffiseSKAdNetwork-Swift.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    AffiseSettings *affise = [Affise settingsWithAffiseAppId:@"129" secretKey:@"93a40b54-6f12-443f-a250-ebf67c5ee4d2"];
    [affise setProduction:false]; //To enable debug methods set Production to false
    [affise startWithApp:application launchOptions:launchOptions]; // Start Affise SDK
 
//    if (@available(iOS 16.1, *)) {
//    } else {
//        [AffiseSKAd registerWithCompletionHandler:^(NSString * error) {
//            // Handle error
//            NSLog(@"%@", error);
//        }];
//    }
//    
//    [AffiseSKAd updatePostbackWithFineValue:1
//                                coarseValue:[CoarseConversionValue medium]
//                          completionHandler:^(NSString * error) {
//        // Handle error
//        NSLog(@"%@", error);
//    }];
    
    return YES;
}
@end
