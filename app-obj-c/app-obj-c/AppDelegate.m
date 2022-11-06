//
//  AppDelegate.m
//  app-obj-c
//
//  Created by Sergey Korney
//

#import "AppDelegate.h"
#import <AffiseAttributionLib/AffiseAttributionLib-Swift.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    AffiseInitProperties *initProperties = [[AffiseInitProperties alloc] initWithAffiseAppId:@"AffiseDemoApp-Obj-C"
                                                                               partParamName:nil
                                                                          partParamNameToken:nil
                                                                                    appToken:nil
                                                                                isProduction:NO
                                                                                    secretId:nil];
    [Affise.shared loadWithApp:application initProperties:initProperties launchOptions:launchOptions];
    
    return YES;
}
@end
