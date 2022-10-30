//
//  DefaultEventsFactory.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation
import AfficeAttributionLib


class DefaultEventsFactory: EventsFactory {
    func createEvents() -> [Event] {
        return [
            createAchieveLevelEvent(),
            createAddPaymentInfoEvent(),
            createAddToCartEvent(),
            createAddToWishlistEvent(),
            createClickAdvEvent(),
            createCompleteRegistrationEvent(),
            createCompleteStreamEvent(),
            createCompleteTrialEvent(),
            createCompleteTutorialEvent(),
            createContentItemsViewEvent(),
            createCustomId01Event(),
            createCustomId02Event(),
            createCustomId03Event(),
            createCustomId04Event(),
            createCustomId05Event(),
            createCustomId06Event(),
            createCustomId07Event(),
            createCustomId08Event(),
            createCustomId09Event(),
            createCustomId10Event(),
            createDeepLinkedEvent(),
            createInitiatePurchaseEvent(),
            createInitiateStreamEvent(),
            createInviteEvent(),
            createLastAttributedTouchEvent(),
            createListViewEvent(),
            createLoginEvent(),
            createOpenedFromPushNotificationEvent(),
            createPurchaseEvent(),
            createRateEvent(),
            createReEngageEvent(),
            createReserveEvent(),
            createSearchEvent(),
            createShareEvent(),
            createSpendCreditsEvent(),
            createStartRegistrationEvent(),
            createStartTrialEvent(),
            createStartTutorialEvent(),
            createSubscribeEvent(),
            createTravelBookingEvent(),
            createUnlockAchievementEvent(),
            createUnsubscribeEvent(),
            createUpdateEvent(),
            createViewAdvEvent(),
            createViewCartEvent(),
            createViewItemEvent(),
            createViewItemsEvent(),
            createInitialSubscriptionEvent(),
            createInitialTrialEvent(),
            createInitialOfferEvent(),
            createConvertedTrialEvent(),
            createConvertedOfferEvent(),
            createTrialInRetryEvent(),
            createOfferInRetryEvent(),
            createSubscriptionInRetryEvent(),
            createRenewedSubscriptionEvent(),
            createFailedSubscriptionFromRetryEvent(),
            createFailedOfferFromRetryEvent(),
            createFailedTrialFromRetryEvent(),
            createFailedSubscriptionEvent(),
            createFailedOfferiseEvent(),
            createFailedTrialEvent(),
            createReactivatedSubscriptionEvent(),
            createRenewedSubscriptionFromRetryEvent(),
            createConvertedOfferFromRetryEvent(),
            createConvertedTrialFromRetryEvent()
        ]
    }
    
    func createConvertedTrialFromRetryEvent() -> Event {
        return ConvertedTrialFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createConvertedOfferFromRetryEvent() -> Event {
        return ConvertedOfferFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createRenewedSubscriptionFromRetryEvent() -> Event {
        return RenewedSubscriptionFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createReactivatedSubscriptionEvent() -> Event {
        return ReactivatedSubscriptionEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createFailedTrialEvent() -> Event {
        return FailedTrialEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createFailedOfferiseEvent() -> Event {
        return FailedOfferiseEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createFailedSubscriptionEvent() -> Event {
        return FailedSubscriptionEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createFailedTrialFromRetryEvent() -> Event {
        return FailedTrialFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createFailedOfferFromRetryEvent() -> Event {
        return FailedOfferFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createFailedSubscriptionFromRetryEvent() -> Event {
        return FailedSubscriptionFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createRenewedSubscriptionEvent() -> Event {
        return RenewedSubscriptionEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createTrialInRetryEvent() -> Event {
        return TrialInRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createOfferInRetryEvent() -> Event {
        return OfferInRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createSubscriptionInRetryEvent() -> Event {
        return SubscriptionInRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createInitialOfferEvent() -> Event {
        return InitialOfferEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createInitialTrialEvent() -> Event {
        return InitialTrialEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createInitialSubscriptionEvent() -> Event {
        return InitialSubscriptionEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createConvertedTrialEvent() -> Event {
        return ConvertedTrialEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createConvertedOfferEvent() -> Event {
        return ConvertedOfferEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createAchieveLevelEvent() -> Event {
        let level = [
            ("old_level", 69),
            ("new_level", 70)
        ]
        return AchieveLevelEvent(level: level, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "warlock").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.DEEP_LINK, value: "https://new-game.lt")
            $0.addPredefinedParameter(parameter: PredefinedParameters.SCORE, value: "25013")
            $0.addPredefinedParameter(parameter: PredefinedParameters.LEVEL, value: "70")
            $0.addPredefinedParameter(parameter: PredefinedParameters.SUCCESS, value: "true")
            $0.addPredefinedParameter(parameter: PredefinedParameters.TUTORIAL_ID, value: "12")
        }
    }
    
    func createAddPaymentInfoEvent() -> Event {
        let data = [
            ("card", 4138),
            ("type", "phone")
        ] as [(String, Any?)]
        return AddPaymentInfoEvent(paymentInfo: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "taxi").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PURCHASE_CURRENCY, value: "USD")
        }
    }
    
    func createAddToCartEvent() -> Event {
        let products =
        ["milk", "cookies", "meat", "vegetables"].shuffled().first
        let items = [
            ("items", products)
        ]
        return AddToCartEvent(addToCartObject: items, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000)).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.DESCRIPTION, value: "best before 2029")
        }
    }
    
    func createAddToWishlistEvent() -> Event {
        let wishes = ["car", "house", "sdk"].shuffled().first
        let items = [
            ("items", wishes)
        ]
        return AddToWishlistEvent(wishList: items, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "next year").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.COUNTRY, value: "Russia")
            $0.addPredefinedParameter(parameter: PredefinedParameters.CITY, value: "Voronezh")
            $0.addPredefinedParameter(parameter: PredefinedParameters.LAT, value: "42")
            $0.addPredefinedParameter(parameter: PredefinedParameters.LONG, value: "24")
        }
    }
    
    func createClickAdvEvent() -> Event {
        return ClickAdvEvent(advertisement: "facebook-meta", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "header").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "PARAM_01")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_02, value: "PARAM_02")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_03, value: "PARAM_03")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_04, value: "PARAM_04")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_05, value: "PARAM_05")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_06, value: "PARAM_06")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_07, value: "PARAM_07")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_08, value: "PARAM_08")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_09, value: "PARAM_09")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_10, value: "PARAM_10")
        }
    }
    
    func createCompleteRegistrationEvent() -> Event {
        let data = [
            ("email", "dog@gmail.com")
        ]
        return CompleteRegistrationEvent(registration: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "promo").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.VALIDATED, value: "02.11.2021")
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVIEW_TEXT, value: "approve")
            $0.addPredefinedParameter(parameter: PredefinedParameters.CUSTOMER_SEGMENT, value: "DOG")
        }
    }
    
    func createCompleteStreamEvent() -> Event {
        let data = [
            ("streamer", "cat"),
            ("max_viewers", "29")
        ]
        return CompleteStreamEvent(stream: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "23 hours").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REVENUE, value: "225522 $")
        }
    }
    
    func createCompleteTrialEvent() -> Event {
        let data = [
            ("player", "ghost")
        ]
        return CompleteTrialEvent(trial: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "time").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REGISTRATION_METHOD, value: "SMS")
        }
    }
    
    func createCompleteTutorialEvent() -> Event {
        let data = [
            ("name", "intro")
        ]
        return CompleteTutorialEvent(tutorial: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "intro").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.REGISTRATION_METHOD, value: "SMS")
        }
    }
    
    func createContentItemsViewEvent() -> Event {
        let data = [
            [("item", "book")],
            [("item", "guitar")]
        ]
        return ContentItemsViewEvent(objects: data, userData: "personal").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.CONTENT, value: "Greatest Hits")
            $0.addPredefinedParameter(parameter: PredefinedParameters.CONTENT_ID, value: "2561")
            $0.addPredefinedParameter(parameter: PredefinedParameters.CONTENT_LIST, value: "songs, videos")
            $0.addPredefinedParameter(parameter: PredefinedParameters.CONTENT_TYPE, value: "MATURE")
            $0.addPredefinedParameter(parameter: PredefinedParameters.CURRENCY, value: "USD")
        }
    }
    
    func createCustomId01Event() -> Event {
        return CustomId01Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createCustomId02Event() -> Event {
        return CustomId02Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createCustomId03Event() -> Event {
        return CustomId03Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createCustomId04Event() -> Event {
        return CustomId04Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createCustomId05Event() -> Event {
        return CustomId05Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createCustomId06Event() -> Event {
        return CustomId06Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createCustomId07Event() -> Event {
        return CustomId07Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createCustomId08Event() -> Event {
        return CustomId08Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createCustomId09Event() -> Event {
        return CustomId09Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createCustomId10Event() -> Event {
        return CustomId10Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createDeepLinkedEvent() -> Event {
        return DeepLinkedEvent(isLinked: true, userData: "referrer: google").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.ADREV_AD_TYPE, value: "interstitial")
            $0.addPredefinedParameter(parameter: PredefinedParameters.REGION, value: "ASIA")
            $0.addPredefinedParameter(parameter: PredefinedParameters.CLASS, value: "student")
        }
    }
    
    func createInitiatePurchaseEvent() -> Event {
        let data = [
            ("payment", "card")
        ]
        return InitiatePurchaseEvent(purchaseData: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "best price").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.ORDER_ID, value: "23123")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PRICE, value: "2.19$")
            $0.addPredefinedParameter(parameter: PredefinedParameters.QUANTITY, value: "1")
        }
    }
    
    func createInitiateStreamEvent() -> Event {
        let data = [
            ("streamer", "car"),
            ("date", "02.03.2021")
        ]
        return InitiateStreamEvent(stream: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "shooter").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.COUPON_CODE, value: "25XLKM")
            $0.addPredefinedParameter(parameter: PredefinedParameters.VIRTUAL_CURRENCY_NAME, value: "BTC")
        }
    }
    
    func createInviteEvent() -> Event {
        let data = [
            ("invitation", "mail"),
            ("date", "02.03.2021")
        ]
        return InviteEvent(invite: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "dancing").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createLastAttributedTouchEvent() -> Event {
        let touchData = [
            ("header", 2)
        ]
        return LastAttributedTouchEvent(
            touchType: TouchType.CLICK,
            timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000),
            touchData: touchData,
            userData: "tablet"
        ).apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.SUBSCRIPTION_ID, value: "lasAK22")
        }
    }
    
    func createListViewEvent() -> Event {
        let data = [
            ("clothes", 2)
        ]
        return ListViewEvent(list: data, userData: "items").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PAYMENT_INFO_AVAILABLE, value: "card")
            $0.addPredefinedParameter(parameter: PredefinedParameters.SEARCH_STRING, value: "best car wash")
            $0.addPredefinedParameter(parameter: PredefinedParameters.SUGGESTED_DESTINATIONS, value: "crete, spain")
            $0.addPredefinedParameter(
                parameter: PredefinedParameters.SUGGESTED_HOTELS,
                value: "beach resort, marina spa"
            )
        }
    }
    
    func createLoginEvent() -> Event {
        let data = [
            ("email", "cat@gmail.com")
        ]
        return LoginEvent(login: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "web").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createOpenedFromPushNotificationEvent() -> Event {
        return OpenedFromPushNotificationEvent(details: "silent", userData: "active").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createPurchaseEvent() -> Event {
        let data = [
            ("phone", 1),
            ("case", 1)
        ]
        return PurchaseEvent(purchaseData: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "apple").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.ORDER_ID, value: "23123")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PRICE, value: "2.19$")
            $0.addPredefinedParameter(parameter: PredefinedParameters.QUANTITY, value: "1")
        }
    }
    
    func createRateEvent() -> Event {
        let data = [
            ("rating", 5)
        ]
        return RateEvent(rate: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "no bugs").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PREFERRED_NEIGHBORHOODS, value: "2")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PREFERRED_NUM_STOPS, value: "4")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PREFERRED_PRICE_RANGE, value: "10-22")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PREFERRED_STAR_RATINGS, value: "4.6")
        }
    }
    
    func createReEngageEvent() -> Event {
        return ReEngageEvent(reEngage: "data", userData: "web").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.CUSTOMER_USER_ID, value: "4")
        }
    }
    
    func createReserveEvent() -> Event {
        let data = [
            ("ticket", "movie")
        ]
        let data2 = [
            ("food", "coke")
        ]
        return ReserveEvent(reserve: [data, data2], timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "discount").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.ORDER_ID, value: "23123")
            $0.addPredefinedParameter(parameter: PredefinedParameters.PRICE, value: "2.19$")
            $0.addPredefinedParameter(parameter: PredefinedParameters.QUANTITY, value: "1")
        }
    }
    
    func createSearchEvent() -> Event {
        let data = ["eco milk", "grass"]
        return SearchEvent(search: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "browser").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createShareEvent() -> Event {
        let data = [
            ("post_id", "252242"),
            ("post_img", "img.webp")
        ]
        
        return ShareEvent(share: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "telegram").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.RECEIPT_ID, value: "22")
        }
    }
    
    func createSpendCreditsEvent() -> Event {
        return SpendCreditsEvent(credits: 2142, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "boosters").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createStartRegistrationEvent() -> Event {
        let data = [
            ("time", "19:22:11")
        ]
        return StartRegistrationEvent(registration: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "referrer").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createStartTrialEvent() -> Event {
        let data = [
            ("time", "19:22:11")
        ]
        return StartTrialEvent(trial: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "30-days").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createStartTutorialEvent() -> Event {
        let data = [
            ("time", "19:22:11"),
            ("reward", "22")
        ]
        
        return StartTutorialEvent(tutorial: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "video-feature").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createSubscribeEvent() -> Event {
        let data = [
            ("streamer", "cat")
        ]
        return SubscribeEvent(subscribe: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "wire").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createTravelBookingEvent() -> Event {
        let data = ["may", "august"]
        return TravelBookingEvent(details: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "booking").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.NUM_ADULTS, value: "1")
            $0.addPredefinedParameter(parameter: PredefinedParameters.NUM_CHILDREN, value: "2")
            $0.addPredefinedParameter(parameter: PredefinedParameters.NUM_INFANTS, value: "1")
            $0.addPredefinedParameter(parameter: PredefinedParameters.DATE_A, value: "30.12.2020")
            $0.addPredefinedParameter(parameter: PredefinedParameters.DATE_B, value: "01.01.2021")
            $0.addPredefinedParameter(parameter: PredefinedParameters.DEPARTING_ARRIVAL_DATE, value: "01.01.2021")
            $0.addPredefinedParameter(parameter: PredefinedParameters.DEPARTING_DEPARTURE_DATE, value: "30.12.2020")
            $0.addPredefinedParameter(parameter: PredefinedParameters.DESTINATION_A, value: "usa")
            $0.addPredefinedParameter(parameter: PredefinedParameters.DESTINATION_B, value: "mexico")
            $0.addPredefinedParameter(parameter: PredefinedParameters.DESTINATION_LIST, value: "usa, mexico")
            $0.addPredefinedParameter(parameter: PredefinedParameters.HOTEL_SCORE, value: "5")
            $0.addPredefinedParameter(parameter: PredefinedParameters.TRAVEL_START, value: "01.12.2020")
            $0.addPredefinedParameter(parameter: PredefinedParameters.TRAVEL_END, value: "01.12.2021")
        }
    }
    
    func createUnlockAchievementEvent() -> Event {
        let data = [
            ("achievement", "new level")
        ]
        return UnlockAchievementEvent(achievement: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "best damage").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.USER_SCORE, value: "12552")
            $0.addPredefinedParameter(parameter: PredefinedParameters.ACHIEVEMENT_ID, value: "1334-1225-ASDZ")
        }
    }
    
    func createUnsubscribeEvent() -> Event {
        let data = [
            ("reason", "span")
        ]
        return UnsubscribeEvent(unsubscribe: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "02.01.2021").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createUpdateEvent() -> Event {
        let data = ["com.facebook"]
        return UpdateEvent(details: data, userData: "firmware").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.EVENT_START, value: "01.02.2021")
            $0.addPredefinedParameter(parameter: PredefinedParameters.EVENT_END, value: "01.01.2022")
            $0.addPredefinedParameter(parameter: PredefinedParameters.NEW_VERSION, value: "8")
            $0.addPredefinedParameter(parameter: PredefinedParameters.OLD_VERSION, value: "1.8")
        }
    }
    
    func createViewAdvEvent() -> Event {
        let data = [
            ("source", "amazon")
        ]
        return ViewAdvEvent(ad: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "skip").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.RETURNING_ARRIVAL_DATE, value: "01.12.2021")
            $0.addPredefinedParameter(parameter: PredefinedParameters.RETURNING_DEPARTURE_DATE, value: "01.12.2020")
        }
    }
    
    func createViewCartEvent() -> Event {
        let data = [
            ("cart_value", "25.22$"),
            ("cart_items", "2")
        ]
        return ViewCartEvent(objects: data, userData: "main").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.PARAM_01, value: "param1")
        }
    }
    
    func createViewItemEvent() -> Event {
        let data = [
            ("section_name", "header")
        ]
        return ViewItemEvent(item: data, userData: "main").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.MAX_RATING_VALUE, value: "5")
            $0.addPredefinedParameter(parameter: PredefinedParameters.RATING_VALUE, value: "4.9")
        }
    }
    
    func createViewItemsEvent() -> Event {
        let data = [[("section_name", "header")],
                    [("section_name", "section-1")],
                    [("section_name", "section-2")],
                    [("section_name", "footer")]
        ]
        return ViewItemsEvent(items: data, userData: "main").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.MAX_RATING_VALUE, value: "5")
            $0.addPredefinedParameter(parameter: PredefinedParameters.RATING_VALUE, value: "4.9")
        }
    }
}
