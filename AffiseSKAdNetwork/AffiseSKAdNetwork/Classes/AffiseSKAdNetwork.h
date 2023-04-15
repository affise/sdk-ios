//
//  AffiseSKAdNetwork.h
//  AffiseAttributionSKAd
//
//  Created by Sergey Korney
//  
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN
extern NSString *const kAffiseSKAdNetworkErrorDomain;

typedef NS_ENUM(NSUInteger, AffiseSKAdNetworkErrorCode) {
  /** Unknown error. See `userInfo` for details. */
    AffiseSKAdNetworkErrorCodeUnknown = 0,
};


typedef void(^AffiseSKAdNetworkCompletionHandler)(NSError *_Nullable error);


@interface AffiseSKAdNetwork : NSObject
+ (nullable instancetype)shared;

- (void)registerAppForAdNetworkAttributionWithCompletionHandler:(AffiseSKAdNetworkCompletionHandler)completionHandler;
- (void)updateConversionValue:(NSInteger)conversionValue completionHandler:(AffiseSKAdNetworkCompletionHandler)completionHandler;
- (void)updatePostbackConversionValue:(NSInteger)conversionValue completionHandler:(AffiseSKAdNetworkCompletionHandler)completionHandler;
- (void)updatePostbackConversionValue:(NSInteger)fineValue coarseValue:(NSString *)coarseValue completionHandler:(AffiseSKAdNetworkCompletionHandler)completionHandler;
- (void)updatePostbackConversionValue:(NSInteger)fineValue coarseValue:(NSString *)coarseValue lockWindow:(BOOL)lockWindow completionHandler:(AffiseSKAdNetworkCompletionHandler)completionHandler;
@end
NS_ASSUME_NONNULL_END
