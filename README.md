# Affise Attribution iOS Library

| Pod  | Version |
| ---- |:-------:|
| AffiseAttributionLib  | [1.6.1](https://github.com/CocoaPods/Specs/tree/master/Specs/a/9/3/AffiseAttributionLib) |
| AffiseSKAdNetwork  | [1.6.1](https://github.com/CocoaPods/Specs/tree/master/Specs/3/6/f/AffiseSKAdNetwork) |

- [Affise Attribution iOS Library](#affise-attribution-ios-library)
- [Description](#description)
  - [Quick start](#quick-start)
  - [Integration](#integration)
    - [Integrate as Cocoapods](#integrate-as-cocoapods)
    - [Initialize](#initialize)
  - [StoreKit Ad Network](#storekit-ad-network)
- [Features](#features)
  - [Device identifiers collection](#device-identifiers-collection)
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
  - [WebView tracking](#webview-tracking)
    - [Initialize WebView](#initialize-webview)
    - [Events tracking JS](#events-tracking-js)
    - [Predefined event parameters JS](#predefined-event-parameters-js)
    - [Custom events JS](#custom-events-js)

# Description

Affise SDK is a software you can use to collect app usage statistics, device identifiers, deeplink usage, track install
referrer.

## Quick start

## Integration

### Integrate as Cocoapods

To add the SDK using Cocoapods, specify the version you want to use in your Podfile:

```ruby
// Get pod from repository
pod 'AffiseAttributionLib', '~> 1.6.1'

// Get source directly from GitHub
pod 'AffiseAttributionLib', :git => 'https://github.com/affise/sdk-ios.git', :tag => '1.6.1'
```

### Initialize

After library is added as dependency sync project with gradle files and initialize.

> Demo app [AppDelegate.swift](app/app/AppDelegate.swift)

For swift use:

```swift
import AffiseAttributionLib

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let properties = AffiseInitProperties(
            affiseAppId: "Your appId", //Change to your app id
            secretKey: "Your secretKey" //Change to your appToken
        )
        Affise.shared.load(app: application, initProperties: properties, launchOptions: launchOptions)

        return true
    }
}
```

For objective-c use:

```objective-c
#import "AppDelegate.h"
#import <AffiseAttributionLib/AffiseAttributionLib-Swift.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    AffiseInitProperties *initProperties = [[AffiseInitProperties alloc] 
        initWithAffiseAppId:@"Your appId" //Change to your app id
        secretKey:@"Your secretKey" //Change to your appToken
    ];
    [Affise.shared loadWithApp:application initProperties:initProperties launchOptions:launchOptions];

    return YES;
}
@end
```

## StoreKit Ad Network

To add the SDK using Cocoapods, specify the version you want to use in your Podfile:

```ruby
// Get pod from repository
pod 'AffiseSKAdNetwork', '~> 1.6.1'

// Get source directly from GitHub
pod 'AffiseSKAdNetwork', :git => 'https://github.com/affise/sdk-ios.git', :tag => '1.6.1'
```

For use:

For ios prior `15.4`

```swift
import AffiseSKAdNetwork

AffiseSKAdNetwork.shared()?.registerAppForAdNetworkAttribution(completionHandler: { error in                
    // Handle error
})

AffiseSKAdNetwork.shared()?.updateConversionValue(conversionValue, completionHandler: { error in
    // Handle error
})
```

For ios `15.4`

```swift
import AffiseSKAdNetwork

AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(fineValue, completionHandler: { error in
    // Handle error
})
```

For ios `16.1`

```swift
import AffiseSKAdNetwork

AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(fineValue, coarseValue, completionHandler: { error in
    // Handle error
})
```

Configure your app to send postback copies to Affise:

Add key `NSAdvertisingAttributionReportEndpoint` to `Info.plist`
Set key value to `https://affise-skadnetwork.com/`

Example: `example/ios/Runner/Info.plist`

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

## Device identifiers collection

To match users with events and data library is sending, these identifiers are collected:

- `AFFISE_APP_ID`
- `AFFISE_PKG_APP_NAME`
- `AFFISE_APP_NAME_DASHBOARD`
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
- `API_LEVEL_OS`
- `AFFISE_SDK_VERSION`
- `OS_VERSION`
- `RANDOM_USER_ID`
- `AFFISE_SDK_POS`
- `TIMEZONE_DEV`
- `LAST_TIME_SESSION`
- `TIME_SESSION`
- `AFFISE_SESSION_COUNT`
- `LIFETIME_SESSION_COUNT`
- `AFFISE_DEEPLINK`
- `AFFISE_PART_PARAM_NAME`
- `AFFISE_PART_PARAM_NAME_TOKEN`
- `AFFISE_APP_TOKEN`
- `LABEL`
- `AFFISE_SDK_SECRET_ID`
- `UUID`
- `AFFISE_APP_OPENED`
- `PUSHTOKEN`
- `EVENTS`
- `AFFISE_EVENTS_COUNT`

## Events tracking

For example, we want to track what items usually user adds to shopping cart. To send event first create it with
following code

```swift
class Presenter {
    func onUserAddsItemsToCart(items: String) {
        let items = [
            ("items", "cookies, potato, milk")
        ]
        Affise.shared.sendEvent(event: AddToCartEvent("groceries").apply {
            $0.addPredefinedParameter(PredefinedString.DESCRIPTION, string: "best before 2029")
            $0.addPredefinedParameter(PredefinedObject.CONTENT, object: items)
        })
    }
}
```

For objective-c use:

```objective-c
- (void)onUserAddsItemsToCart:(NSString *)itemsToCart {
    NSArray *items = @[
        @{"items", itemsToCart}
    ];

    Event *event = [[AddToCartEvent alloc] initWithAddToCartObject:@"groceries"];
    [event addPredefinedParameterWithParameter:PredefinedString.ADREV_AD_TYPE value:@"best before 2029"];
    [event addPredefinedParameterWithParameter:PredefinedObject.CONTENT object:items];

    [Affise.shared sendEventWithEvent: event];
}
```

With above example you can implement other events:

- `AchieveLevel`
- `AddPaymentInfo`
- `AddToCart`
- `AddToWishlist`
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

## Predefined event parameters

To enrich your event with another dimension, you can use predefined parameters for most common cases.
Add it to any event:

```swift
class Presenter {
    func onUserAddsItemsToCart(items: String) {
        let items = [
            ("items", "cookies, potato, milk")
        ]
        Affise.shared.sendEvent(event: AddToCartEvent("groceries", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000)).apply {
            $0.addPredefinedParameter(PredefinedString.DESCRIPTION, string: "best before 2029")
            $0.addPredefinedParameter(PredefinedObject.CONTENT, object: items)
        })
    }
}
```

For objective-c use:

```objective-c
- (void)onUserAddsItemsToCart:(NSString *)itemsToCart {
    NSArray *items = @[
        @{"items", itemsToCart}
    ];

    Event *event = [[AddToCartEvent alloc] initWithAddToCartObject:@"groceries"
                                                   timeStampMillis:NSDate.date.timeIntervalSince1970];
    [event addPredefinedParameterWithParameter:PredefinedString.ADREV_AD_TYPE value:@"best before 2029"];
    [event addPredefinedParameterWithParameter:PredefinedObject.CONTENT object:items];

    [Affise.shared sendEventWithEvent: event];
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

- `ADREV_AD_TYPE`
- `CITY`
- `COUNTRY`
- `REGION`
- `CLASS`
- `CONTENT_ID`
- `CONTENT_TYPE`
- `CURRENCY`
- `CUSTOMER_USER_ID`
- `DESCRIPTION`
- `DESTINATION_A`
- `DESTINATION_B`
- `DESTINATION_LIST`
- `ORDER_ID`
- `PAYMENT_INFO_AVAILABLE`
- `PREFERRED_NEIGHBORHOODS`
- `PURCHASE_CURRENCY`
- `RECEIPT_ID`
- `REGISTRATION_METHOD`
- `SEARCH_STRING`
- `SUBSCRIPTION_ID`
- `SUCCESS`
- `SUGGESTED_DESTINATIONS`
- `SUGGESTED_HOTELS`
- `VALIDATED`
- `ACHIEVEMENT_ID`
- `COUPON_CODE`
- `CUSTOMER_SEGMENT`
- `DEEP_LINK`
- `NEW_VERSION`
- `OLD_VERSION`
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
- `REVIEW_TEXT`
- `TUTORIAL_ID`
- `VIRTUAL_CURRENCY_NAME`
- `STATUS`

### PredefinedLong

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

After you have done with firebase inegration, add to your cloud messaging service `onNewToken` method `Affise.share.addPushToken(token)`

```swift
func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
  print("Firebase registration token: \(String(describing: fcmToken))")

  // New token generated
  Affise.share.addPushToken(fcmToken)
}
```

## Reinstall Uninstall tracking

Affise automaticly track reinstall events by using silent-push technology, to make this feature work, pass push token when it is recreated by user and on you application starts up

```kotlin
Affise.share.addPushToken(token)
```

## Deeplinks

To integrate deeplink support You can find out how to set up deeplinks in the [official documentation](https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app).

Register deeplink callback right after Affise.share.init(..)

```swift
Affise.share.init(..)
Affise.shared.registerDeeplinkCallback { url in
    let component = URLComponents(string: url.absoluteString)!
    let screen = component.queryItems?.first(where: {$0.name == "screen"})?.value
    if let screen = screen, screen == "special_offer" {
        // open special offer activity
    } else {
        // open another activity
    }
}
```

Add deeplink handler to `AppDelegate.swift` as in `app/app/AppDelegate.swift`

```swift
func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
) -> Bool {
    Affise.shared.handleDeeplink(url: url)
    return true
}
```

Add key `CFBundleURLTypes` to `Info.plist`

Example: `app/app/Info.plist`

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLName</key>
        <string>YOUR_AFFISE_APP_ID.affattr.com</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>affise</string>
        </array>
    </dict>
</array>
```

## Get random user Id

Use the next public method of SDK

```swift
Affise.shared.getRandomUserId()
```

## Get random device Id

Use the next public method of SDK

```swift
Affise.shared.getRandomDeviceId()
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
Affise.shared.registerWebView(webView)

```

Other Javascript enviroment features is described below.

### Events tracking JS

> Demo app [index.html](app/app/index.html)

After WebView is initialized you send events from JavaScript enviroment

```javascript
let data = { card: 4138, type: 'phone' };
let event = new AddPaymentInfoEvent({
  userData: 'taxi',
};

event.addPredefinedParameter(PredefinedString.PURCHASE_CURRENCY, 'USD');
event.addPredefinedParameter(PredefinedFloat.PRICE, 2.19);
event.addPredefinedParameter(PredefinedObject.CONTENT, data);

Affise.sendEvent(event);
```

Just like with native SDK, javascript enviroment also provides default events that can be passed from WebView:

- `AchieveLevelEvent`
- `AddPaymentInfoEvent`
- `AddToCartEvent`
- `AddToWishlistEvent`
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

event.addPredefinedParameter(PredefinedString.PURCHASE_CURRENCY, 'USD');
event.addPredefinedParameter(PredefinedFloat.PRICE, 2.19);
event.addPredefinedParameter(PredefinedLong.QUANTITY, 1);
event.addPredefinedParameter(PredefinedObject.CONTENT, { card: 4138, type: 'phone' });
event.addPredefinedParameter(PredefinedListObject.CONTENT_LIST, [{content:'songs'}, {content:'videos'}]);

Affise.sendEvent(event);
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
