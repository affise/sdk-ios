//
//  DefaultEventsFactory.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation
import AffiseAttributionLib


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
            createOrderEvent(),
            createOrderCancelEvent(),
            createOrderReturnRequestEvent(),
            createOrderReturnRequestCancelEvent(),
            createPurchaseEvent(),
            createRateEvent(),
            createReEngageEvent(),
            createReserveEvent(),
            createSalesEvent(),
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
            createConvertedTrialFromRetryEvent(),
            createUnsubscriptionEvent()
        ]
    }
    
    func createUnsubscriptionEvent() -> Event {
        return UnsubscriptionEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Unsubscription"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createConvertedTrialFromRetryEvent() -> Event {
        return ConvertedTrialFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createConvertedOfferFromRetryEvent() -> Event {
        return ConvertedOfferFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createRenewedSubscriptionFromRetryEvent() -> Event {
        return RenewedSubscriptionFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createReactivatedSubscriptionEvent() -> Event {
        return ReactivatedSubscriptionEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createFailedTrialEvent() -> Event {
        return FailedTrialEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createFailedOfferiseEvent() -> Event {
        return FailedOfferiseEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createFailedSubscriptionEvent() -> Event {
        return FailedSubscriptionEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createFailedTrialFromRetryEvent() -> Event {
        return FailedTrialFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createFailedOfferFromRetryEvent() -> Event {
        return FailedOfferFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createFailedSubscriptionFromRetryEvent() -> Event {
        return FailedSubscriptionFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createRenewedSubscriptionEvent() -> Event {
        return RenewedSubscriptionEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createTrialInRetryEvent() -> Event {
        return TrialInRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createOfferInRetryEvent() -> Event {
        return OfferInRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createSubscriptionInRetryEvent() -> Event {
        return SubscriptionInRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createInitialOfferEvent() -> Event {
        return InitialOfferEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createInitialTrialEvent() -> Event {
        return InitialTrialEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createInitialSubscriptionEvent() -> Event {
        return InitialSubscriptionEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createConvertedTrialEvent() -> Event {
        return ConvertedTrialEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createConvertedOfferEvent() -> Event {
        return ConvertedOfferEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        ).apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createAchieveLevelEvent() -> Event {
        let level = [
            ("old_level", 69),
            ("new_level", 70)
        ]
        return AchieveLevelEvent(level: level, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "warlock").apply {
            $0.addPredefinedParameter(PredefinedString.DEEP_LINK, string: "https://new-game.lt")
            $0.addPredefinedParameter(PredefinedLong.SCORE, long: 25013)
            $0.addPredefinedParameter(PredefinedLong.LEVEL, long: 70)
            $0.addPredefinedParameter(PredefinedString.SUCCESS, string: "true")
            $0.addPredefinedParameter(PredefinedString.TUTORIAL_ID, string: "12")
        }
    }
    
    func createAddPaymentInfoEvent() -> Event {
        let data = [
            ("card", 4138),
            ("type", "phone")
        ] as [(String, Any?)]
        return AddPaymentInfoEvent(paymentInfo: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "taxi").apply {
            $0.addPredefinedParameter(PredefinedString.PURCHASE_CURRENCY, string: "USD")
        }
    }
    
    func createAddToCartEvent() -> Event {
        let products =
        ["milk", "cookies", "meat", "vegetables"].shuffled().first
        let items = [
            ("items", products)
        ]
        return AddToCartEvent(addToCartObject: items, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000)).apply {
            $0.addPredefinedParameter(PredefinedString.DESCRIPTION, string: "best before 2029")
        }
    }
    
    func createAddToWishlistEvent() -> Event {
        let wishes = ["car", "house", "sdk"].shuffled().first
        let items = [
            ("items", wishes)
        ]
        return AddToWishlistEvent(wishList: items, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "next year").apply {
            $0.addPredefinedParameter(PredefinedString.COUNTRY, string: "Russia")
            $0.addPredefinedParameter(PredefinedString.CITY, string: "Voronezh")
            $0.addPredefinedParameter(PredefinedFloat.LAT, float: 42)
            $0.addPredefinedParameter(PredefinedFloat.LONG, float: 24)
        }
    }
    
    func createClickAdvEvent() -> Event {
        return ClickAdvEvent(advertisement: "facebook-meta", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "header").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "PARAM_01")
            $0.addPredefinedParameter(PredefinedString.PARAM_02, string: "PARAM_02")
            $0.addPredefinedParameter(PredefinedString.PARAM_03, string: "PARAM_03")
            $0.addPredefinedParameter(PredefinedString.PARAM_04, string: "PARAM_04")
            $0.addPredefinedParameter(PredefinedString.PARAM_05, string: "PARAM_05")
            $0.addPredefinedParameter(PredefinedString.PARAM_06, string: "PARAM_06")
            $0.addPredefinedParameter(PredefinedString.PARAM_07, string: "PARAM_07")
            $0.addPredefinedParameter(PredefinedString.PARAM_08, string: "PARAM_08")
            $0.addPredefinedParameter(PredefinedString.PARAM_09, string: "PARAM_09")
            $0.addPredefinedParameter(PredefinedString.PARAM_10, string: "PARAM_10")
        }
    }
    
    func createCompleteRegistrationEvent() -> Event {
        let data = [
            ("email", "dog@gmail.com")
        ]
        return CompleteRegistrationEvent(registration: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "promo").apply {
            $0.addPredefinedParameter(PredefinedString.VALIDATED, string: "02.11.2021")
            $0.addPredefinedParameter(PredefinedString.REVIEW_TEXT, string: "approve")
            $0.addPredefinedParameter(PredefinedString.CUSTOMER_SEGMENT, string: "DOG")
        }
    }
    
    func createCompleteStreamEvent() -> Event {
        let data = [
            ("streamer", "cat"),
            ("max_viewers", "29")
        ]
        return CompleteStreamEvent(stream: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "23 hours").apply {
            $0.addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
        }
    }
    
    func createCompleteTrialEvent() -> Event {
        let data = [
            ("player", "ghost")
        ]
        return CompleteTrialEvent(trial: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "time").apply {
            $0.addPredefinedParameter(PredefinedString.REGISTRATION_METHOD, string: "SMS")
        }
    }
    
    func createCompleteTutorialEvent() -> Event {
        let data = [
            ("name", "intro")
        ]
        return CompleteTutorialEvent(tutorial: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "intro").apply {
            $0.addPredefinedParameter(PredefinedString.REGISTRATION_METHOD, string: "SMS")
        }
    }
    
    func createContentItemsViewEvent() -> Event {
        let data = [
            [("item", "book")],
            [("item", "guitar")]
        ]
        return ContentItemsViewEvent(objects: data, userData: "personal").apply {
            $0.addPredefinedParameter(PredefinedObject.CONTENT, object: [("collection", "Greatest Hits")])
            $0.addPredefinedParameter(PredefinedString.CONTENT_ID, string: "2561")
            $0.addPredefinedParameter(PredefinedListObject.CONTENT_LIST, listObject: [[("content", "songs, videos")]])
            $0.addPredefinedParameter(PredefinedString.CONTENT_TYPE, string: "MATURE")
            $0.addPredefinedParameter(PredefinedString.CURRENCY, string: "USD")
        }
    }
    
    func createCustomId01Event() -> Event {
        return CustomId01Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createCustomId02Event() -> Event {
        return CustomId02Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createCustomId03Event() -> Event {
        return CustomId03Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createCustomId04Event() -> Event {
        return CustomId04Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createCustomId05Event() -> Event {
        return CustomId05Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createCustomId06Event() -> Event {
        return CustomId06Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createCustomId07Event() -> Event {
        return CustomId07Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createCustomId08Event() -> Event {
        return CustomId08Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createCustomId09Event() -> Event {
        return CustomId09Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createCustomId10Event() -> Event {
        return CustomId10Event(custom: "custom", timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "custom").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createDeepLinkedEvent() -> Event {
        return DeepLinkedEvent(isLinked: true, userData: "referrer: google").apply {
            $0.addPredefinedParameter(PredefinedString.ADREV_AD_TYPE, string: "interstitial")
            $0.addPredefinedParameter(PredefinedString.REGION, string: "ASIA")
            $0.addPredefinedParameter(PredefinedString.CLASS, string: "student")
        }
    }
    
    func createInitiatePurchaseEvent() -> Event {
        let data = [
            ("payment", "card")
        ]
        return InitiatePurchaseEvent(purchaseData: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "best price").apply {
            $0.addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            $0.addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            $0.addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
        }
    }
    
    func createInitiateStreamEvent() -> Event {
        let data = [
            ("streamer", "car"),
            ("date", "02.03.2021")
        ]
        return InitiateStreamEvent(stream: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "shooter").apply {
            $0.addPredefinedParameter(PredefinedString.COUPON_CODE, string: "25XLKM")
            $0.addPredefinedParameter(PredefinedString.VIRTUAL_CURRENCY_NAME, string: "BTC")
        }
    }
    
    func createInviteEvent() -> Event {
        let data = [
            ("invitation", "mail"),
            ("date", "02.03.2021")
        ]
        return InviteEvent(invite: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "dancing").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
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
            $0.addPredefinedParameter(PredefinedString.SUBSCRIPTION_ID, string: "lasAK22")
        }
    }
    
    func createListViewEvent() -> Event {
        let data = [
            ("clothes", 2)
        ]
        return ListViewEvent(list: data, userData: "items").apply {
            $0.addPredefinedParameter(PredefinedString.PAYMENT_INFO_AVAILABLE, string: "card")
            $0.addPredefinedParameter(PredefinedString.SEARCH_STRING, string: "best car wash")
            $0.addPredefinedParameter(PredefinedString.SUGGESTED_DESTINATIONS, string: "create, spain")
            $0.addPredefinedParameter(PredefinedString.SUGGESTED_HOTELS, string: "beach resort, marina spa")
        }
    }
    
    func createLoginEvent() -> Event {
        let data = [
            ("email", "cat@gmail.com")
        ]
        return LoginEvent(login: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "web").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createOpenedFromPushNotificationEvent() -> Event {
        return OpenedFromPushNotificationEvent(details: "silent", userData: "active").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }

    func createOrderEvent() -> Event {
        return OrderEvent("apple").apply {
            $0.addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            $0.addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            $0.addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
        }
    }

    func createOrderCancelEvent() -> Event {
        return OrderCancelEvent("apple").apply {
            $0.addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            $0.addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            $0.addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
        }
    }

    func createOrderReturnRequestEvent() -> Event {
        return OrderReturnRequestEvent("apple").apply {
            $0.addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            $0.addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            $0.addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
        }
    }

    func createOrderReturnRequestCancelEvent() -> Event {
        return OrderReturnRequestCancelEvent("apple").apply {
            $0.addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            $0.addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            $0.addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
        }
    }
    
    func createPurchaseEvent() -> Event {
        let data = [
            ("phone", 1),
            ("case", 1)
        ]
        return PurchaseEvent(purchaseData: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "apple").apply {
            $0.addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            $0.addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            $0.addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
        }
    }
    
    func createRateEvent() -> Event {
        let data = [
            ("rating", 5)
        ]
        return RateEvent(rate: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "no bugs").apply {
            $0.addPredefinedParameter(PredefinedString.PREFERRED_NEIGHBORHOODS, string: "2")
            $0.addPredefinedParameter(PredefinedLong.PREFERRED_NUM_STOPS, long: 4)
            $0.addPredefinedParameter(PredefinedFloat.PREFERRED_PRICE_RANGE, float: 10.22)
            $0.addPredefinedParameter(PredefinedLong.PREFERRED_STAR_RATINGS, long: 6)
        }
    }
    
    func createReEngageEvent() -> Event {
        return ReEngageEvent(reEngage: "data", userData: "web").apply {
            $0.addPredefinedParameter(PredefinedString.CUSTOMER_USER_ID, string: "4")
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
            $0.addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            $0.addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            $0.addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
        }
    }
    
    func createSalesEvent() -> Event {
        let data = [
            ("phone", 1),
            ("case", 1)
        ]
        
        return SalesEvent(salesData: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "apple").apply {
            $0.addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            $0.addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            $0.addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
        }
    }

    func createSearchEvent() -> Event {
        let data = ["eco milk", "grass"]
        return SearchEvent(search: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "browser").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createShareEvent() -> Event {
        let data = [
            ("post_id", "252242"),
            ("post_img", "img.webp")
        ]
        
        return ShareEvent(share: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "telegram").apply {
            $0.addPredefinedParameter(PredefinedString.RECEIPT_ID, string: "22")
        }
    }
    
    func createSpendCreditsEvent() -> Event {
        return SpendCreditsEvent(credits: 2142, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "boosters").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createStartRegistrationEvent() -> Event {
        let data = [
            ("time", "19:22:11")
        ]
        return StartRegistrationEvent(registration: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "referrer").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createStartTrialEvent() -> Event {
        let data = [
            ("time", "19:22:11")
        ]
        return StartTrialEvent(trial: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "30-days").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createStartTutorialEvent() -> Event {
        let data = [
            ("time", "19:22:11"),
            ("reward", "22")
        ]
        
        return StartTutorialEvent(tutorial: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "video-feature").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createSubscribeEvent() -> Event {
        let data = [
            ("streamer", "cat")
        ]
        return SubscribeEvent(subscribe: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "wire").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createTravelBookingEvent() -> Event {
        let data = ["may", "august"]
        return TravelBookingEvent(details: data, userData: "booking").apply {
            $0.addPredefinedParameter(PredefinedLong.NUM_ADULTS, long: 1)
            $0.addPredefinedParameter(PredefinedLong.NUM_CHILDREN, long: 2)
            $0.addPredefinedParameter(PredefinedLong.NUM_INFANTS, long: 1)
            $0.addPredefinedParameter(PredefinedLong.DATE_A, long: 1609268400000)
            $0.addPredefinedParameter(PredefinedLong.DATE_B, long: 1609441200000)
            $0.addPredefinedParameter(PredefinedLong.DEPARTING_ARRIVAL_DATE, long: 1609441200000)
            $0.addPredefinedParameter(PredefinedLong.DEPARTING_DEPARTURE_DATE, long: 1609268400000)
            $0.addPredefinedParameter(PredefinedString.DESTINATION_A, string: "usa")
            $0.addPredefinedParameter(PredefinedString.DESTINATION_B, string: "mexico")
            $0.addPredefinedParameter(PredefinedString.DESTINATION_LIST, string: "usa, mexico")
            $0.addPredefinedParameter(PredefinedLong.HOTEL_SCORE, long: 5)
            $0.addPredefinedParameter(PredefinedLong.TRAVEL_START, long: 1606762800000)
            $0.addPredefinedParameter(PredefinedLong.TRAVEL_END, long: 1638298800000)
        }
    }
    
    func createUnlockAchievementEvent() -> Event {
        let data = [
            ("achievement", "new level")
        ]
        return UnlockAchievementEvent(achievement: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "best damage").apply {
            $0.addPredefinedParameter(PredefinedLong.USER_SCORE, long: 12552)
            $0.addPredefinedParameter(PredefinedString.ACHIEVEMENT_ID, string: "1334-1225-ASDZ")
        }
    }
    
    func createUnsubscribeEvent() -> Event {
        let data = [
            ("reason", "span")
        ]
        return UnsubscribeEvent(unsubscribe: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "02.01.2021").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createUpdateEvent() -> Event {
        let data = ["com.facebook"]
        return UpdateEvent(details: data, userData: "firmware").apply {
            $0.addPredefinedParameter(PredefinedLong.EVENT_START, long: 1612119600000)
            $0.addPredefinedParameter(PredefinedLong.EVENT_END, long: 1640977200000)
            $0.addPredefinedParameter(PredefinedString.NEW_VERSION, string: "8")
            $0.addPredefinedParameter(PredefinedString.OLD_VERSION, string: "1.8")
        }
    }
    
    func createViewAdvEvent() -> Event {
        let data = [
            ("source", "amazon")
        ]
        return ViewAdvEvent(ad: data, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "skip").apply {
            $0.addPredefinedParameter(PredefinedLong.RETURNING_ARRIVAL_DATE, long: 1638298800000)
            $0.addPredefinedParameter(PredefinedLong.RETURNING_DEPARTURE_DATE, long: 1669834800000)
        }
    }
    
    func createViewCartEvent() -> Event {
        let data = [
            ("cart_value", "25.22$"),
            ("cart_items", "2")
        ]
        return ViewCartEvent(objects: data, userData: "main").apply {
            $0.addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
        }
    }
    
    func createViewItemEvent() -> Event {
        let data = [
            ("section_name", "header")
        ]
        return ViewItemEvent(item: data, userData: "main").apply {
            $0.addPredefinedParameter(PredefinedLong.MAX_RATING_VALUE, long: 5)
            $0.addPredefinedParameter(PredefinedLong.RATING_VALUE, long: 9)
        }
    }
    
    func createViewItemsEvent() -> Event {
        let data = [[("section_name", "header")],
                    [("section_name", "section-1")],
                    [("section_name", "section-2")],
                    [("section_name", "footer")]
        ]
        return ViewItemsEvent(items: data, userData: "main").apply {
            $0.addPredefinedParameter(PredefinedLong.MAX_RATING_VALUE, long: 5)
            $0.addPredefinedParameter(PredefinedLong.RATING_VALUE, long: 9)
        }
    }
}
