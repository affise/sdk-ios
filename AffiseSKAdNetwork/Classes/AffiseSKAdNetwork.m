//
//  AffiseSKAdNetwork.m
//  AffiseAttributionSKAd
//
//  Created by Sergey Korney
//  
//

#import "AffiseSKAdNetwork.h"


NS_ASSUME_NONNULL_BEGIN
NSString *const kAffiseSKAdNetworkErrorDomain = @"affiseSKAdNetworkError";


@implementation AffiseSKAdNetwork
+ (nullable instancetype)shared {
    static AffiseSKAdNetwork *shared = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}


- (instancetype)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    return self;
}


#pragma mark - SKAdNetwork
- (void)registerAppForAdNetworkAttributionWithCompletionHandler:(AffiseSKAdNetworkCompletionHandler)completionHandler {
    Class class = self.skadNetworkClass;
    SEL selector = NSSelectorFromString(@"registerAppForAdNetworkAttribution");
    NSError *error;
    
    if (@available(iOS 14.0, *)) {
        if ([self isApiAvailableForClass:class andSelector:selector error:&error]) {
            NSMethodSignature *methodSignature = [class methodSignatureForSelector:selector];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
            [invocation setSelector:selector];
            [invocation setTarget:class];
            [invocation invoke];
        }
    }
    
    completionHandler(error);
}


- (void)updateConversionValue:(NSInteger)conversionValue
            completionHandler:(AffiseSKAdNetworkCompletionHandler)completionHandler {
    
    Class class = self.skadNetworkClass;
    SEL selector = NSSelectorFromString(@"updateConversionValue:");
    NSError *error;
    
    if (@available(iOS 14.0, *)) {
        if ([self isApiAvailableForClass:class andSelector:selector error:&error]) {
            NSMethodSignature *methodSignature = [class methodSignatureForSelector:selector];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
            [invocation setSelector:selector];
            [invocation setTarget:class];
            [invocation setArgument:&conversionValue atIndex:2];
            [invocation invoke];
        }
    }
    
    completionHandler(error);
}


- (void)updatePostbackConversionValue:(NSInteger)conversionValue
                    completionHandler:(AffiseSKAdNetworkCompletionHandler)completionHandler {
    
    Class class = self.skadNetworkClass;
    SEL selector = NSSelectorFromString(@"updatePostbackConversionValue:completionHandler:");
    NSError *error;
    
    if (@available(iOS 15.4, *)) {
        if ([self isApiAvailableForClass:class andSelector:selector error:&error]) {
            NSMethodSignature *methodSignature = [class methodSignatureForSelector:selector];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
            [invocation setSelector:selector];
            [invocation setTarget:class];
            [invocation setArgument:&conversionValue atIndex:2];
            [invocation setArgument:&completionHandler atIndex:3];
            [invocation invoke];
            return;
        }
    }
    
    completionHandler(error);
}


- (void)updatePostbackConversionValue:(NSInteger)fineValue
                          coarseValue:(NSString *)coarseValue
                    completionHandler:(AffiseSKAdNetworkCompletionHandler)completionHandler {
    
    Class class = self.skadNetworkClass;
    SEL selector = NSSelectorFromString(@"updatePostbackConversionValue:coarseValue:completionHandler:");
    NSError *error;
    
    if (@available(iOS 16.1, *)) {
        if ([self isApiAvailableForClass:class andSelector:selector error:&error]) {
            NSMethodSignature *methodSignature = [class methodSignatureForSelector:selector];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
            [invocation setSelector:selector];
            [invocation setTarget:class];
            [invocation setArgument:&fineValue atIndex:2];
            [invocation setArgument:&coarseValue atIndex:3];
            [invocation setArgument:&completionHandler atIndex:4];
            [invocation invoke];
            return;
        }
    }
    
    completionHandler(error);
}


- (void)updatePostbackConversionValue:(NSInteger)fineValue
                          coarseValue:(NSString *)coarseValue
                           lockWindow:(BOOL)lockWindow
                    completionHandler:(AffiseSKAdNetworkCompletionHandler)completionHandler {
    
    Class class = self.skadNetworkClass;
    SEL selector = NSSelectorFromString(@"updatePostbackConversionValue:coarseValue:lockWindow:completionHandler:");
    NSError *error;
    
    if (@available(iOS 16.1, *)) {
        if ([self isApiAvailableForClass:class andSelector:selector error:&error]) {
            NSMethodSignature *methodSignature = [class methodSignatureForSelector:selector];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
            [invocation setSelector:selector];
            [invocation setTarget:class];
            [invocation setArgument:&fineValue atIndex:2];
            [invocation setArgument:&coarseValue atIndex:3];
            [invocation setArgument:&lockWindow atIndex:4];
            [invocation setArgument:&completionHandler atIndex:5];
            [invocation invoke];
        }
    }
    
    completionHandler(error);
}


#pragma mark - Private
- (nullable Class)skadNetworkClass {
    return NSClassFromString(@"SKAdNetwork");
}


- (BOOL)isApiAvailableForClass:(Class)class andSelector:(SEL)selector error:(NSError **)error {
    if (class == nil) {
        if (error != nil) {
            *error = [AffiseSKAdNetwork errorWithCode:AffiseSKAdNetworkErrorCodeUnknown
                                        failureReason:@"StoreKit.framework not found in the app (SKAdNetwork class not found)"
                                      underlyingError:nil];
        }
        return NO;
    }
    if (!selector) {
        if (error != nil) {
            *error = [AffiseSKAdNetwork errorWithCode:AffiseSKAdNetworkErrorCodeUnknown
                                        failureReason:@"Selector for given method was not found"
                                      underlyingError:nil];
        }
        return NO;
    }
    if ([class respondsToSelector:selector] == NO) {
        *error = [AffiseSKAdNetwork errorWithCode:AffiseSKAdNetworkErrorCodeUnknown
                                    failureReason:[NSString stringWithFormat:@"%@ method implementation not found", NSStringFromSelector(selector)]
                                  underlyingError:nil];
        return NO;
    }
    
    return YES;
}


+ (NSError *)errorWithCode:(AffiseSKAdNetworkErrorCode)code
             failureReason:(nullable NSString *)failureReason
           underlyingError:(nullable NSError *)underlyingError {
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[NSUnderlyingErrorKey] = underlyingError;
    userInfo[NSLocalizedFailureReasonErrorKey] = failureReason;
    
    return [NSError errorWithDomain:kAffiseSKAdNetworkErrorDomain code:code userInfo:userInfo];
}
@end
NS_ASSUME_NONNULL_END
