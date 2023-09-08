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
    
    AffiseInitProperties *initProperties = [[AffiseInitProperties alloc] initWithAffiseAppId:@"AffiseDemoApp-Obj-C"
                                                                               partParamName:nil
                                                                          partParamNameToken:nil
                                                                                    appToken:nil
                                                                                isProduction:NO
                                                                                    secretKey:nil];
    
    [Affise loadWithApp:application initProperties:initProperties launchOptions:launchOptions];
    
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
