# Affise Attribution iOS Library

| Pod  | Version |
| ---- |:-------:|
| `AffiseAttributionLib` | [`1.6.28`](https://github.com/CocoaPods/Specs/tree/master/Specs/a/9/3/AffiseAttributionLib) |
| `AffiseSKAdNetwork`    | [`1.6.28`](https://github.com/CocoaPods/Specs/tree/master/Specs/3/6/f/AffiseSKAdNetwork)    |
| `AffiseModule/Advertising`  | [`1.6.28`](https://github.com/CocoaPods/Specs/tree/master/Specs/0/3/d/AffiseModule/)        |
| `AffiseModule/Status`  | [`1.6.28`](https://github.com/CocoaPods/Specs/tree/master/Specs/0/3/d/AffiseModule/)        |

- [Affise Attribution iOS Library](#affise-attribution-ios-library)
- [Description](#description)
  - [Quick start](#quick-start)
  - [Integration](#integration)
    - [Integrate as Cocoapods](#integrate-as-cocoapods)
    - [Integrate as Swift Package Manager](#integrate-as-swift-package-manager)
    - [Initialize](#initialize)
      - [Domain](#domain)
    - [Modules](#modules)
      - [Advertising](#advertising)
    - [Requirements](#requirements)
  - [StoreKit Ad Network](#storekit-ad-network)
- [Features](#features)
  - [ProviderType identifiers collection](#providertype-identifiers-collection)
    - [Attribution](#attribution)
  - [Events tracking](#events-tracking)
  - [Custom events tracking](#custom-events-tracking)
  - [Predefined event parameters](#predefined-event-parameters)
    - [PredefinedString](#predefinedstring)
    - [PredefinedLong](#predefinedlong)
    - [PredefinedFloat](#predefinedfloat)
    - [PredefinedObject](#predefinedobject)
    - [PredefinedListObject](#predefinedlistobject)
    - [PredefinedListString](#predefinedliststring)
  - [Events buffering](#events-buffering)
  - [Push token tracking](#push-token-tracking)
  - [Reinstall Uninstall tracking](#reinstall-uninstall-tracking)
  - [Deeplinks](#deeplinks)
  - [Get random user Id](#get-random-user-id)
  - [Get random device Id](#get-random-device-id)
  - [Get providers](#get-providers)
  - [Is first run](#is-first-run)
  - [Get referrer](#get-referrer)
  - [Get referrer parameter](#get-referrer-parameter)
    - [Referrer keys](#referrer-keys)
  - [Get module state](#get-module-state)
  - [WebView tracking](#webview-tracking)
    - [Initialize WebView](#initialize-webview)
    - [Events tracking JS](#events-tracking-js)
    - [Predefined event parameters JS](#predefined-event-parameters-js)
    - [Custom events JS](#custom-events-js)
  - [SDK to SDK integrations](#sdk-to-sdk-integrations)
    - [AdMob](#admob)
    - [AppLovin MAX](#applovin-max)
    - [Helium by Chartboost](#helium-by-chartboost)
    - [ironSource](#ironsource)
  - [Custom](#custom)
    - [ConversionId](#conversionid)
- [Debug](#debug)
  - [Validate credentials](#validate-credentials)
- [Troubleshoots](#troubleshoots)
  
# Description

Affise SDK is a software you can use to collect app usage statistics, device identifiers, deeplink usage, track install
referrer.

## Quick start

## Integration

### Integrate as Cocoapods

To add the SDK using Cocoapods, specify the version you want to use in your Podfile:

```ruby
# Affise SDK library
pod 'AffiseAttributionLib', '~> 1.6.28'
# Affise modules
pod 'AffiseModule/Advertising', '~> 1.6.28'
pod 'AffiseModule/Status', '~> 1.6.28'
```

Get source directly from GitHub

```ruby
# Affise SDK library
pod 'AffiseAttributionLib', :git => 'https://github.com/affise/sdk-ios.git', :tag => '1.6.28'
# Affise modules
pod 'AffiseModule/Advertising', :git => 'https://github.com/affise/sdk-ios.git', :tag => '1.6.28'
pod 'AffiseModule/Status', :git => 'https://github.com/affise/sdk-ios.git', :tag => '1.6.28'
```

### Integrate as Swift Package Manager

To add the SDK using SPM:

1. Open XCode project, navigate to `File / Add Packages`.

2. In the `Add New Package` window enter `https://github.com/affise/sdk-ios` in `search` field.

3. Click on the `Add Package` button.

4. In `Choose Package Products` window select required packages and click `Add Package`, and it will be added to your iOS project and linked automatically.

### Initialize

After library is added as dependency sync project with gradle files and initialize.

For `swift` use:

> Demo app [AppDelegate.swift](example/app/app/AppDelegate.swift)

```swift
import AffiseAttributionLib

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Affise
            .settings(
                affiseAppId: "Your appId", //Change to your app id
                secretKey: "Your secretKey" //Change to your appToken
            )
            .start(app: application, launchOptions: launchOptions) // Start Affise SDK

        return true
    }
}
```

For `objective-c` use: 

> Demo app [AppDelegate.m](example/app-obj-c/app-obj-c/AppDelegate.m)

```objective-c
#import "AppDelegate.h"
#import <AffiseAttributionLib/AffiseAttributionLib-Swift.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    AffiseSettings *affise = [Affise settingsWithAffiseAppId:@"Your appId" //Change to your app id
                                                   secretKey:@"Your secretKey" //Change to your appToken
    ];
    [affise setProduction:false]; //To enable debug methods set Production to false
    [affise startWithApp:application launchOptions:launchOptions]; // Start Affise SDK

    return YES;
}
@end
```

Check if library is initialized

```swift
Affise.isInitialized()
```

#### Domain

Set SDK server doamin:

```swift
Affise
    .settings(
        affiseAppId: "Your appId",
        secretKey: "Your secretKey"
    )
    .setDomain("https://YourCustomDomain") // Set custom domain
    .start(app: application, launchOptions: launchOptions)
```

### Modules

> **Warning**
>
> 🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥
>
> How to install modules read in [Integration section](#integration)
>
> 🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥

| Module        | Version                                                                              | Start    |
| ------------- |:------------------------------------------------------------------------------------:|----------|
| `Advertising` | [`1.6.28`](https://github.com/CocoaPods/Specs/tree/master/Specs/0/3/d/AffiseModule/) | `Manual` |
| `Status`      | [`1.6.28`](https://github.com/CocoaPods/Specs/tree/master/Specs/0/3/d/AffiseModule/) | `Auto`   |

If module start type is `manual`, then call:

```swift
Affise.moduleStart(.Advertising)
```

Get list of installed modules:

```swift
Affise.getModulesInstalled()
```

#### Advertising

This module required to Use [`IDFA`](https://developer.apple.com/documentation/adsupport/asidentifiermanager/advertisingidentifier) (Identifier for advertisers)

> **Warning**
> 
> 🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥
>
> Module Advertising requires `NSUserTrackingUsageDescription` key in `info.plist`
>
> Application will crash if key not present
> 
> 🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥

Open `info.plist` and add key `NSUserTrackingUsageDescription` with string value. For more information [read requirements](#requirements)

### Requirements

Affise Advertising module uses `AppTrackingTransparency` framework to get `advertisingIdentifier`
For working functionality your app needs to declare [`NSUserTrackingUsageDescription` permission](https://developer.apple.com/documentation/bundleresources/information_property_list/nsusertrackingusagedescription):

Open XCode project `info.plist` and add key `NSUserTrackingUsageDescription` with string value

```xml
<plist version="1.0">
<dict>
    ...
	<key>NSUserTrackingUsageDescription</key>
	<string>Youre permission text</string>
</dict>
```

## StoreKit Ad Network

To add the SDK using Cocoapods, specify the version you want to use in your Podfile:

```ruby
# Wrapper for StoreKit Ad Network 
pod 'AffiseSKAdNetwork', '~> 1.6.28'
```

Get source directly from GitHub

```ruby
# Wrapper for StoreKit Ad Network 
pod 'AffiseSKAdNetwork', :git => 'https://github.com/affise/sdk-ios.git', :tag => '1.6.28'
```

For `swift` use:

> Demo app [AppDelegate.swift](example/app/app/AppDelegate.swift)

> **Note**
>
> 🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦
> 
> For ios prior `16.1` first call
> 
> 🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦

```swift
import AffiseSKAdNetwork

AffiseSKAd.register { error in
    // Handle error
}
```

For `objective-c` use:

> Demo app [AppDelegate.m](example/app-obj-c/app-obj-c/AppDelegate.m)

```objective-c
#import <AffiseSKAdNetwork/AffiseSKAdNetwork-Swift.h>

[AffiseSKAd registerWithCompletionHandler:^(NSString * error) {
    // Handle error
}];
```

Updates the fine and coarse conversion values, and calls a completion handler if the update fails.

> **Note**
>
> 🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦
> 
> Second argument `coarseValue` is available in iOS `16.1+`
>
> 🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦🟦

```swift
AffiseSKAd.updatePostbackConversionValue(fineValue: 1, coarseValue: CoarseConversionValue.medium) { error in
    // Handle error
}
```

For `objective-c` use:

```objective-c
#import <AffiseSKAdNetwork/AffiseSKAdNetwork-Swift.h>

[AffiseSKAd updatePostbackWithFineValue:1
                            coarseValue:[CoarseConversionValue medium]
                        completionHandler:^(NSString * error) {
    // Handle error
}];
```

Configure your app to send postback copies to Affise:

Add key `NSAdvertisingAttributionReportEndpoint` to `Info.plist`
Set key value to `https://affise-skadnetwork.com/`

Example: [`example/ios/Runner/Info.plist`](example/ios/Runner/Info.plist)

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
      <key>NSAdvertisingAttributionReportEndpoint</key>
      <string>https://affise-skadnetwork.com/</string>
    </dict>
</array>
```

# Features

## ProviderType identifiers collection

To match users with events and data library is sending, these `ProviderType` identifiers are collected:

### Attribution

- `AFFISE_APP_ID`
- `AFFISE_PKG_APP_NAME`
- `AFF_APP_NAME_DASHBOARD`
- `APP_VERSION`
- `APP_VERSION_RAW`
- `STORE`
- `TRACKER_TOKEN`
- `TRACKER_NAME`
- `FIRST_TRACKER_TOKEN`
- `FIRST_TRACKER_NAME`
- `LAST_TRACKER_TOKEN`
- `LAST_TRACKER_NAME`
- `OUTDATED_TRACKER_TOKEN`
- `INSTALLED_TIME`
- `FIRST_OPEN_TIME`
- `INSTALLED_HOUR`
- `FIRST_OPEN_HOUR`
- `INSTALL_FIRST_EVENT`
- `INSTALL_BEGIN_TIME`
- `INSTALL_FINISH_TIME`
- `REFERRAL_TIME`
- `CREATED_TIME`
- `CREATED_TIME_MILLI`
- `CREATED_TIME_HOUR`
- `UNINSTALL_TIME`
- `REINSTALL_TIME`
- `LAST_SESSION_TIME`
- `CONNECTION_TYPE`
- `CPU_TYPE`
- `HARDWARE_NAME`
- `NETWORK_TYPE`
- `DEVICE_MANUFACTURER`
- `PROXY_IP_ADDRESS`
- `DEEPLINK_CLICK`
- `DEVICE_ATLAS_ID`
- `AFFISE_DEVICE_ID`
- `AFFISE_ALT_DEVICE_ID`
- `ADID`
- `ANDROID_ID`
- `ANDROID_ID_MD5`
- `MAC_SHA1`
- `MAC_MD5`
- `GAID_ADID`
- `GAID_ADID_MD5`
- `OAID`
- `OAID_MD5`
- `ALTSTR_ADID`
- `FIREOS_ADID`
- `COLOROS_ADID`
- `REFTOKEN`
- `REFTOKENS`
- `REFERRER`
- `USER_AGENT`
- `MCCODE`
- `MNCODE`
- `ISP`
- `REGION`
- `COUNTRY`
- `LANGUAGE`
- `DEVICE_NAME`
- `DEVICE_TYPE`
- `OS_NAME`
- `PLATFORM`
- `SDK_PLATFORM`
- `API_LEVEL_OS`
- `AFFISE_SDK_VERSION`
- `OS_VERSION`
- `RANDOM_USER_ID`
- `AFFISE_SDK_POS`
- `TIMEZONE_DEV`
- `AFFISE_EVENT_TOKEN`
- `LAST_TIME_SESSION`
- `TIME_SESSION`
- `AFFISE_SESSION_COUNT`
- `LIFETIME_SESSION_COUNT`
- `AFFISE_DEEPLINK`
- `AFFISE_PART_PARAM_NAME`
- `AFFISE_PART_PARAM_NAME_TOKEN`
- `AFFISE_EVENT_NAME`
- `AFFISE_APP_TOKEN`
- `LABEL`
- `AFFISE_SDK_SECRET_ID`
- `UUID`
- `AFFISE_APP_OPENED`
- `PUSHTOKEN`
- `IS_EMULATOR`

## Events tracking

For example, we want to track what items usually user adds to shopping cart. To send event first create it with
following code

```swift
class Presenter {
    func onUserAddsItemsToCart(items: String) {
        let items = [
            ("items", "cookies, potato, milk")
        ]

        AddToCartEvent("groceries")
            .addPredefinedParameter(PredefinedString.DESCRIPTION, string: "best before 2029")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: items)
            .send() // Send event
    }
}
```

For `objective-c` use:

```objective-c
- (void)onUserAddsItemsToCart:(NSString *)itemsToCart {
    NSArray *items = @[
        @{"items", itemsToCart}
    ];

    Event *event = [[AddToCartEvent alloc] init:@"groceries"];
    [event addPredefinedParameter:PredefinedStringADREV_AD_TYPE value:@"best before 2029"];
    [event addPredefinedParameter:PredefinedObjectCONTENT object:items];
    // Send event
    [event send];
}
```

With above example you can implement other events:

- `AchieveLevel`
- `AddPaymentInfo`
- `AddToCart`
- `AddToWishlist`
- `AdRevenue`
- `ClickAdv`
- `CompleteRegistration`
- `CompleteStream`
- `CompleteTrial`
- `CompleteTutorial`
- `Contact`
- `ContentItemsView`
- `CustomizeProduct`
- `DeepLinked`
- `Donate`
- `FindLocation`
- `InitiateCheckout`
- `InitiatePurchase`
- `InitiateStream`
- `Invite`
- `LastAttributedTouch`
- `Lead`
- `ListView`
- `Login`
- `OpenedFromPushNotification`
- `Order`
- `OrderItemAdded`
- `OrderItemRemove`
- `OrderCancel`
- `OrderReturnRequest`
- `OrderReturnRequestCancel`
- `Purchase`
- `Rate`
- `ReEngage`
- `Reserve`
- `Sales`
- `Schedule`
- `Search`
- `Share`
- `SpendCredits`
- `StartRegistration`
- `StartTrial`
- `StartTutorial`
- `SubmitApplication`
- `Subscribe`
- `TravelBooking`
- `UnlockAchievement`
- `Unsubscribe`
- `Update`
- `ViewAdv`
- `ViewCart`
- `ViewContent`
- `ViewItem`
- `ViewItems`
- `InitialSubscription`
- `InitialTrial`
- `InitialOffer`
- `ConvertedTrial`
- `ConvertedOffer`
- `TrialInRetry`
- `OfferInRetry`
- `SubscriptionInRetry`
- `RenewedSubscription`
- `FailedSubscriptionFromRetry`
- `FailedOfferFromRetry`
- `FailedTrialFromRetry`
- `FailedSubscription`
- `FailedOfferise`
- `FailedTrial`
- `ReactivatedSubscription`
- `RenewedSubscriptionFromRetry`
- `ConvertedOfferFromRetry`
- `ConvertedTrialFromRetry`
- `Unsubscription`

## Custom events tracking

Use any of custom events if default doesn't fit your scenario:

- `CustomId01`
- `CustomId02`
- `CustomId03`
- `CustomId04`
- `CustomId05`
- `CustomId06`
- `CustomId07`
- `CustomId08`
- `CustomId09`
- `CustomId10`

If above event functionality still limits your usecase, you can use `UserCustomEvent`

```swift
UserCustomEvent(eventName: "MyCustomEvent")
    .send()   
```

## Predefined event parameters

To enrich your event with another dimension, you can use predefined parameters for most common cases.
Add it to any event:

```swift
class Presenter {
    func onUserAddsItemsToCart(items: String) {
        let items = [
            ("items", "cookies, potato, milk")
        ]

        AddToCartEvent("groceries")
            .addPredefinedParameter(PredefinedString.DESCRIPTION, string: "best before 2029")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: items)
            .send() // Send event  
    }
}
```

For `objective-c` use:

```objective-c
- (void)onUserAddsItemsToCart:(NSString *)itemsToCart {
    NSArray *items = @[
        @{"items", itemsToCart}
    ];

    Event *event = [[AddToCartEvent alloc] init:@"groceries"];
    [event addPredefinedParameter:PredefinedStringADREV_AD_TYPE value:@"best before 2029"];
    [event addPredefinedParameter:PredefinedObjectCONTENT object:items];
    // Send event
    [event send];
}
```

In examples above `PredefinedParameters.DESCRIPTION` and `PredefinedObject.CONTENT` is used, but many others is available:

| PredefinedParameter                           | Type             |
|-----------------------------------------------|------------------|
| [PredefinedString](#predefinedstring)         | String           |
| [PredefinedLong](#predefinedlong)             | Int64            |
| [PredefinedFloat](#predefinedfloat)           | Float            |
| [PredefinedObject](#predefinedobject)         | [(String, Any)]  |
| [PredefinedListObject](#predefinedlistobject) | [[(String, Any)]]|
| [PredefinedListString](#predefinedliststring) | [String]         |

### PredefinedString

- `ACHIEVEMENT_ID`
- `ADREV_AD_TYPE`
- `BRAND`
- `BRICK`
- `CATALOGUE_ID`
- `CHANNEL_TYPE`
- `CITY`
- `CLASS`
- `CONTENT_ID`
- `CONTENT_NAME`
- `CONTENT_TYPE`
- `CONVERSION_ID`
- `COUNTRY`
- `COUPON_CODE`
- `CURRENCY`
- `CUSTOMER_SEGMENT`
- `CUSTOMER_TYPE`
- `CUSTOMER_USER_ID`
- `DEEP_LINK`
- `DESCRIPTION`
- `DESTINATION_A`
- `DESTINATION_B`
- `DESTINATION_LIST`
- `NEW_VERSION`
- `OLD_VERSION`
- `ORDER_ID`
- `PARAM_01`
- `PARAM_02`
- `PARAM_03`
- `PARAM_04`
- `PARAM_05`
- `PARAM_06`
- `PARAM_07`
- `PARAM_08`
- `PARAM_09`
- `PARAM_10`
- `PAYMENT_INFO_AVAILABLE`
- `PREFERRED_NEIGHBORHOODS`
- `PRODUCT_ID`
- `PRODUCT_NAME`
- `PURCHASE_CURRENCY`
- `RECEIPT_ID`
- `REGION`
- `REGISTRATION_METHOD`
- `REVIEW_TEXT`
- `SEARCH_STRING`
- `SEGMENT`
- `STATUS`
- `SUBSCRIPTION_ID`
- `SUCCESS`
- `SUGGESTED_DESTINATIONS`
- `SUGGESTED_HOTELS`
- `TUTORIAL_ID`
- `UTM_CAMPAIGN`
- `UTM_MEDIUM`
- `UTM_SOURCE`
- `VALIDATED`
- `VERTICAL`
- `VIRTUAL_CURRENCY_NAME`
- `VOUCHER_CODE`

### PredefinedLong

- `AMOUNT`
- `DATE_A`
- `DATE_B`
- `DEPARTING_ARRIVAL_DATE`
- `DEPARTING_DEPARTURE_DATE`
- `HOTEL_SCORE`
- `LEVEL`
- `MAX_RATING_VALUE`
- `NUM_ADULTS`
- `NUM_CHILDREN`
- `NUM_INFANTS`
- `PREFERRED_NUM_STOPS`
- `PREFERRED_STAR_RATINGS`
- `QUANTITY`
- `RATING_VALUE`
- `RETURNING_ARRIVAL_DATE`
- `RETURNING_DEPARTURE_DATE`
- `SCORE`
- `TRAVEL_START`
- `TRAVEL_END`
- `USER_SCORE`
- `EVENT_START`
- `EVENT_END`

### PredefinedFloat

- `PREFERRED_PRICE_RANGE`
- `PRICE`
- `REVENUE`
- `LAT`
- `LONG`

### PredefinedObject

- `CONTENT`

### PredefinedListObject

- `CONTENT_LIST`

### PredefinedListString

- `CONTENT_IDS`

## Events buffering

Affise library will send any pending events with first opportunity,
but if there is no network connection or device is disabled, events are kept locally for 7 days before deletion.

## Push token tracking

To let affise track push token you need to receive it from your push service provider, and pass to Affise library.
First add firebase integration to your app completing theese steps: [Firebase Docs](https://firebase.google.com/docs/cloud-messaging/ios/client)

After you have done with firebase inegration, add to your cloud messaging service `onNewToken` method `Affise.addPushToken(token)`

```swift
func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
  print("Firebase registration token: \(String(describing: fcmToken))")

  // New token generated
  Affise.addPushToken(fcmToken)
}
```

## Reinstall Uninstall tracking

Affise automaticly track reinstall events by using silent-push technology, to make this feature work, pass push token when it is recreated by user and on you application starts up

```swift
Affise.addPushToken(token)
```

## Deeplinks

To integrate deeplink support You can find out how to set up deeplinks in the [official documentation](https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app).

Register deeplink callback right after `Affise.settings(..).start(..)`

```swift
Affise.settings(affiseAppId:affiseAppId, secretKey:secretKey).start(app:app, launchOptions: launchOptions)
Affise.registerDeeplinkCallback { url in
    let component = URLComponents(string: url?.absoluteString ?? "")
    let screen = component?.queryItems?.first(where: {$0.name == "<your_uri_key>"})?.value
    if let screen = screen, screen == "<your_uri_key_value>" {
        // handle value
    }
}
```

Add deeplink handler to [`AppDelegate.swift`](example/app/app/AppDelegate.swift)

```swift
func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
) -> Bool {
    Affise.handleDeeplink(url)
    return true
}
```

Add key `CFBundleURLTypes` to `Info.plist`

Example: [`example/app/app/Info.plist`](example/app/app/Info.plist)

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLName</key>
        <string>YOUR_DOMAIN</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>affise</string>
        </array>
    </dict>
</array>
```

## Get random user Id

```swift
Affise.getRandomUserId()
```

## Get random device Id

```swift
Affise.getRandomDeviceId()
```

## Get providers

Returns providers map with [ProviderType](#providertype-identifiers-collection) as key

```swift
let providers: [ProviderType: Any?] = Affise.getProviders()
let key = ProviderType.AFFISE_APP_TOKEN
let value = providers[key]
```

## Is first run

```swift
Affise.isFirstRun()
```

## Get referrer

> **Note**
>
> Requires [Affise Status Module](#modules)

Use the next public method of SDK

```swift
Affise.getReferrer { referrer in
  // handle referrer
}
```

## Get referrer parameter

> **Note**
>
> Requires [Affise Status Module](#modules)

Use the next public method of SDK to get referrer parameter by

```swift
Affise.getReferrerValue(ReferrerKey.CLICK_ID) { value in
  // handle referrer value
}
```

### Referrer keys

In examples above `ReferrerKey.CLICK_ID` is used, but many others is available:

- `AD_ID`
- `CAMPAIGN_ID`
- `CLICK_ID`
- `AFFISE_AD`
- `AFFISE_AD_ID`
- `AFFISE_AD_TYPE`
- `AFFISE_ADSET`
- `AFFISE_ADSET_ID`
- `AFFISE_AFFC_ID`
- `AFFISE_CHANNEL`
- `AFFISE_CLICK_LOOK_BACK`
- `AFFISE_COST_CURRENCY`
- `AFFISE_COST_MODEL`
- `AFFISE_COST_VALUE`
- `AFFISE_DEEPLINK`
- `AFFISE_KEYWORDS`
- `AFFISE_MEDIA_TYPE`
- `AFFISE_MODEL`
- `AFFISE_OS`
- `AFFISE_PARTNER`
- `AFFISE_REF`
- `AFFISE_SITE_ID`
- `AFFISE_SUB_SITE_ID`
- `AFFISE_SUB_1`
- `AFFISE_SUB_2`
- `AFFISE_SUB_3`
- `AFFISE_SUB_4`
- `AFFISE_SUB_5`
- `AFFC`
- `PID`
- `SUB_1`
- `SUB_2`
- `SUB_3`
- `SUB_4`
- `SUB_5`

## Get module state

```swift
Affise.getStatus(AffiseModules.STATUS) { response in 
    // handle status response
};
```

## WebView tracking

### Initialize WebView

To integrate the library into the JavaScript environment, we added a bridge between JavaScript and the native SDK. Now you can send events and use the functionality of the native library directly from Webview.
Here are step by step instructions:

```swift
// retreive WebView from view hierarhy
@IBOutlet weak var webView: WKWebView!

// make sure javascript is enabled
override func viewDidLoad() {
    super.viewDidLoad()

    webView.configuration.preferences.javaScriptEnabled = true
}

// initialize WebView with Affise native library
Affise.registerWebView(webView)

```

Other Javascript enviroment features is described below.

### Events tracking JS

> Demo app [example/app/app/index.html](example/app/app/index.html)

After WebView is initialized you send events from JavaScript enviroment

```javascript
let data = { card: 4138, type: 'phone' };

new AddPaymentInfoEvent({
  userData: 'taxi',
})
    .addPredefinedParameter(PredefinedString.PURCHASE_CURRENCY, 'USD')
    .addPredefinedParameter(PredefinedFloat.PRICE, 2.19)
    .addPredefinedParameter(PredefinedObject.CONTENT, data);
    .send() // Send event
```

Just like with native SDK, javascript enviroment also provides default events that can be passed from WebView:

- `AchieveLevelEvent`
- `AddPaymentInfoEvent`
- `AddToCartEvent`
- `AddToWishlistEvent`
- `AdRevenueEvent`
- `ClickAdvEvent`
- `CompleteRegistrationEvent`
- `CompleteStreamEvent`
- `CompleteTrialEvent`
- `CompleteTutorialEvent`
- `ContactEvent`
- `ContentItemsViewEvent`
- `CustomId01Event`
- `CustomId02Event`
- `CustomId03Event`
- `CustomId04Event`
- `CustomId05Event`
- `CustomId06Event`
- `CustomId07Event`
- `CustomId08Event`
- `CustomId09Event`
- `CustomId10Event`
- `CustomizeProductEvent`
- `DeepLinkedEvent`
- `DonateEvent`
- `FindLocationEvent`
- `InitiateCheckoutEvent`
- `InitiatePurchaseEvent`
- `InitiateStreamEvent`
- `InviteEvent`
- `LastAttributedTouchEvent`
- `LeadEvent`
- `ListViewEvent`
- `LoginEvent`
- `OpenedFromPushNotificationEvent`
- `OrderEvent`
- `OrderItemAddedEvent`
- `OrderItemRemoveEvent`
- `OrderCancelEvent`
- `OrderReturnRequestEvent`
- `OrderReturnRequestCancelEvent`
- `PurchaseEvent`
- `RateEvent`
- `ReEngageEvent`
- `ReserveEvent`
- `SalesEvent`
- `ScheduleEvent`
- `SearchEvent`
- `ShareEvent`
- `SpendCreditsEvent`
- `StartRegistrationEvent`
- `StartTrialEvent`
- `StartTutorialEvent`
- `SubmitApplicationEvent`
- `SubscribeEvent`
- `TravelBookingEvent`
- `UnlockAchievementEvent`
- `UnsubscribeEvent`
- `UpdateEvent`
- `ViewAdvEvent`
- `ViewCartEvent`
- `ViewContentEvent`
- `ViewItemEvent`
- `ViewItemsEvent`
- `InitialSubscriptionEvent`
- `InitialTrialEvent`
- `InitialOfferEvent`
- `ConvertedTrialEvent`
- `ConvertedOfferEvent`
- `TrialInRetryEvent`
- `OfferInRetryEvent`
- `SubscriptionInRetryEvent`
- `RenewedSubscriptionEvent`
- `FailedSubscriptionFromRetryEvent`
- `FailedOfferFromRetryEvent`
- `FailedTrialFromRetryEvent`
- `FailedSubscriptionEvent`
- `FailedOfferiseEvent`
- `FailedTrialEvent`
- `ReactivatedSubscriptionEvent`
- `RenewedSubscriptionFromRetryEvent`
- `ConvertedOfferFromRetryEvent`
- `ConvertedTrialFromRetryEvent`
- `UnsubscriptionEvent`

### Predefined event parameters JS

Each event can be extended with custom event parameters. By calling `addPredefinedParameter` function you can pass  [predefined parameters](#predefinedstring)

For example:

```javascript
let event = ...

event
    .addPredefinedParameter(PredefinedString.PURCHASE_CURRENCY, 'USD')
    .addPredefinedParameter(PredefinedFloat.PRICE, 2.19)
    .addPredefinedParameter(PredefinedLong.QUANTITY, 1)
    .addPredefinedParameter(PredefinedObject.CONTENT, { card: 4138, type: 'phone' })
    .addPredefinedParameter(PredefinedListObject.CONTENT_LIST, [{content:'songs'}, {content:'videos'}])
    .send(); // Send event
```

### Custom events JS

If above event functionality still limits your usecase, you can allways extend `Event` class to override fields you are missing

```javascript
class MyCustomEvent extends Event {
    constructor(args) {
        super('MyCustom', args)
    }
}
```

## SDK to SDK integrations

### AdMob

For more information how to setup, please check [official docs](https://developers.google.com/admob/ios/impression-level-ad-revenue#implementing_paid_event_handler)

```swift
var rewardedAd: GADRewardedAd?

func requestRewardedAd() {
    GADRewardedAd.load(withAdUnitID: "AD_UNIT_ID", request: GADRequest()) { (ad, error) in
        if let error = error {
            print("Rewarded ad failed to load with error: \(error.localizedDescription)")
            return
        }
        rewardedAd = ad
        rewardedAd?.paidEventHandler = { adValue in
            let responseInfo = ad?.responseInfo
            let loadedAdNetworkResponseInfo = responseInfo?.loadedAdNetworkResponseInfo

            // Send AdRevenue info
            AffiseAdRevenue(AffiseAdSource.ADMOB)
                .setRevenue(adValue.value / 1000000, adValue.currencyCode)
                .setNetwork(loadedAdNetworkResponseInfo?.adSourceName)
                .setUnit(ad?.adUnitID)
                .send()
        }
    }
}
```

### AppLovin MAX

For more information how to setup, please check [official docs](https://dash.applovin.com/documentation/mediation/ios/getting-started/advanced-settings#impression-level-user-revenue-api)

```swift
func didPayRevenue(_ ad: MAAd)
{
    // Send AdRevenue info
    AffiseAdRevenue(AffiseAdSource.APPLOVIN_MAX)
        .setRevenue(ad.revenue, "USD")
        .setNetwork(ad.networkName)
        .setUnit(ad.adUnitIdentifier)
        .setPlacement(ad.placement)
        .send()
}
```

### Helium by Chartboost

For more information how to setup, please check [official docs](https://developers.chartboost.com/docs/mediation-ios-configure-helium#implementation)

```swift
func ilrdObserverInit() {
    NotificationCenter.default.addObserver(
        self,
        selector: #selector(didReceiveILRDNotification),
        name: .heliumDidReceiveILRD,
        object: nil
    )
}

@objc 
func didReceiveILRDNotification(notification: Notification) {
    // Extract the ILRD payload.
    guard let ilrd = notification.object as? HeliumImpressionData else {
        return
    }

    let json = ilrd.jsonData

    guard let revenue = json["ad_revenue"] else {
        return
    }

    guard let currency = json["currency_type"] else {
        return
    }

    // Send AdRevenue info
    AffiseAdRevenue(AffiseAdSource.HELIUM_CHARTBOOST)
        .setRevenue(revenue, currency)
        .setNetwork(json["network_name"])
        .setUnit(json["placement_name"])
        .setPlacement(json["line_item_name"])
        .send()
}
```

### ironSource

For more information how to setup, please check [official docs](https://developers.is.com/ironsource-mobile/ios/ad-revenue-measurement-integration/#step-2)

```swift
func impressionDataDidSucceed(impressionData: ISImpressionData) {
    guard let revenue: NSNumber = impressionData.revenue else {
        return
    }
    let ad_network: String? = impressionData.ad_network
    let all_data: NSDictionary? = impressionData.all_data

    // Send AdRevenue info
    AffiseAdRevenue(AffiseAdSource.IRONSOURCE)
        .setRevenue(revenue.doubleValue, "USD")
        .setNetwork(impressionData.ad_network)
        .setUnit(impressionData.ad_unit)
        .setPlacement(impressionData.placement)
        .send()
}
```

## Custom

### ConversionId

Adds 3 PredefinedString values: `PredefinedString.CONVERSION_ID`, `PredefinedString.ORDER_ID`, `PredefinedString.PRODUCT_ID`

> `CONVERSION_ID` = `ORDER_ID`_`PRODUCT_ID`

```swift
let event = AddToCartEvent()

let conversionId = event.customPredefined().conversionId("ORDER_ID", "PRODUCT_ID")

Affise.sendEvent(event)
```

# Debug

## Validate credentials

> **Warning**
>
> 🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥
> 
> Debug methods WON'T work on Production
>
> 🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥

Validate your credentials by receiving `ValidationStatus` values:

- `VALID` - your credentials are valid
- `INVALID_APP_ID` - your app id is not valid 
- `INVALID_SECRET_KEY` - your SDK secretKey is not valid
- `PACKAGE_NAME_NOT_FOUND` - your application package name not found
- `NOT_WORKING_ON_PRODUCTION` - you using debug method on production
- `NETWORK_ERROR` - network or server not available (for example `Airoplane mode` is active)

```swift
Affise
    .settings(
        affiseAppId: "Your appId",
        secretKey: "Your secretKey" 
    )
    .setProduction(false) //To enable debug methods set Production to false
    .start(app: application, launchOptions: launchOptions) // Start Affise SDK

Affise.Debug.validate { status in
    // Handle validation status
}
```

# Troubleshoots

> **Warning**
> 
> 🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥
>
> This app has crashed because it attempted to access privacy-sensitive data without a usage description.
> 
> The app's `Info.plist` must contain an `NSUserTrackingUsageDescription` key with a string value explaining
> 
> to the user how the app uses this data.
> 
> 🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥

Open `info.plist` and add key `NSUserTrackingUsageDescription` with string value. For more information [read requirements](#requirements)
