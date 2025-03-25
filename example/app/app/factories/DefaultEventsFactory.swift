import AffiseAttributionLib


class DefaultEventsFactory: EventsFactory {
    func createEvents() -> [Event] {
        return [
            createAchieveLevelEvent(),
            createAddPaymentInfoEvent(),
            createAddToCartEvent(),
            createAddToWishlistEvent(),
            createAdRevenueEvent(),
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
            createOrderItemAddedEvent(),
            createOrderItemRemoveEvent(),
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
        )
            .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createConvertedTrialFromRetryEvent() -> Event {
        return ConvertedTrialFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
            .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createConvertedOfferFromRetryEvent() -> Event {
        return ConvertedOfferFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createRenewedSubscriptionFromRetryEvent() -> Event {
        return RenewedSubscriptionFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createReactivatedSubscriptionEvent() -> Event {
        return ReactivatedSubscriptionEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createFailedTrialEvent() -> Event {
        return FailedTrialEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createFailedOfferiseEvent() -> Event {
        return FailedOfferiseEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createFailedSubscriptionEvent() -> Event {
        return FailedSubscriptionEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createFailedTrialFromRetryEvent() -> Event {
        return FailedTrialFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createFailedOfferFromRetryEvent() -> Event {
        return FailedOfferFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createFailedSubscriptionFromRetryEvent() -> Event {
        return FailedSubscriptionFromRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createRenewedSubscriptionEvent() -> Event {
        return RenewedSubscriptionEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createTrialInRetryEvent() -> Event {
        return TrialInRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createOfferInRetryEvent() -> Event {
        return OfferInRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createSubscriptionInRetryEvent() -> Event {
        return SubscriptionInRetryEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createInitialOfferEvent() -> Event {
        return InitialOfferEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createInitialTrialEvent() -> Event {
        return InitialTrialEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createInitialSubscriptionEvent() -> Event {
        return InitialSubscriptionEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createConvertedTrialEvent() -> Event {
        return ConvertedTrialEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createConvertedOfferEvent() -> Event {
        return ConvertedOfferEvent(
            data: [("affise_event_revenue", 2.99),
                   ("affise_event_currency", "USD"),
                   ("affise_event_product_id", 278459628375 as Int64)
                  ],
            userData: "Subscription Plus"
        )
        .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
    }
    
    func createAchieveLevelEvent() -> Event {
        let level = [
            ("old_level", 69),
            ("new_level", 70)
        ]
        return AchieveLevelEvent("warlock")
            .addPredefinedParameter(PredefinedString.DEEP_LINK, string: "https://new-game.lt")
            .addPredefinedParameter(PredefinedLong.SCORE, long: 25013)
            .addPredefinedParameter(PredefinedLong.LEVEL, long: 70)
            .addPredefinedParameter(PredefinedString.SUCCESS, string: "true")
            .addPredefinedParameter(PredefinedString.TUTORIAL_ID, string: "12")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: level)
    }
    
    func createAddPaymentInfoEvent() -> Event {
        let data: [(String, Any?)] = [
            ("card", 4138),
            ("type", "phone")
        ]
        return AddPaymentInfoEvent("taxi")
            .addPredefinedParameter(PredefinedString.PURCHASE_CURRENCY, string: "USD")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createAddToCartEvent() -> Event {
        let products =
        ["milk", "cookies", "meat", "vegetables"].shuffled().first
        let items = [
            ("items", products)
        ]
        return AddToCartEvent()
            .addPredefinedParameter(PredefinedString.DESCRIPTION, string: "best before 2029")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: items)
    }
    
    func createAddToWishlistEvent() -> Event {
        let wishes = ["car", "house", "sdk"].shuffled().first
        let items = [
            ("items", wishes)
        ]
        return AddToWishlistEvent("next year")
            .addPredefinedParameter(PredefinedString.COUNTRY, string: "Russia")
            .addPredefinedParameter(PredefinedString.CITY, string: "Voronezh")
            .addPredefinedParameter(PredefinedFloat.LAT, float: 42)
            .addPredefinedParameter(PredefinedFloat.LONG, float: 24)
            .addPredefinedParameter(PredefinedObject.CONTENT, object: items)
    }
    
    func createAdRevenueEvent() -> Event { 
       return AdRevenueEvent("next year")
            .addPredefinedParameter(.SOURCE, string: AffiseAdSource.ADMOB.type)
            .addPredefinedParameter(.REVENUE, float: 42)
            .addPredefinedParameter(.CURRENCY, string: "USD")
            .addPredefinedParameter(.NETWORK, string: "test")
            .addPredefinedParameter(.UNIT, string: "m")
            .addPredefinedParameter(.PLACEMENT, string: "end")
    }

    func createClickAdvEvent() -> Event {
        return ClickAdvEvent("header")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "PARAM_01")
            .addPredefinedParameter(PredefinedString.PARAM_02, string: "PARAM_02")
            .addPredefinedParameter(PredefinedString.PARAM_03, string: "PARAM_03")
            .addPredefinedParameter(PredefinedString.PARAM_04, string: "PARAM_04")
            .addPredefinedParameter(PredefinedString.PARAM_05, string: "PARAM_05")
            .addPredefinedParameter(PredefinedString.PARAM_06, string: "PARAM_06")
            .addPredefinedParameter(PredefinedString.PARAM_07, string: "PARAM_07")
            .addPredefinedParameter(PredefinedString.PARAM_08, string: "PARAM_08")
            .addPredefinedParameter(PredefinedString.PARAM_09, string: "PARAM_09")
            .addPredefinedParameter(PredefinedString.PARAM_10, string: "PARAM_10")
            .addPredefinedParameter(PredefinedString.DESCRIPTION, string: "facebook-meta")
    }
    
    func createCompleteRegistrationEvent() -> Event {
        let data = [
            ("email", "dog@gmail.com")
        ]
        return CompleteRegistrationEvent("promo")
            .addPredefinedParameter(PredefinedString.VALIDATED, string: "02.11.2021")
            .addPredefinedParameter(PredefinedString.REVIEW_TEXT, string: "approve")
            .addPredefinedParameter(PredefinedString.CUSTOMER_SEGMENT, string: "DOG")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createCompleteStreamEvent() -> Event {
        let data = [
            ("streamer", "cat"),
            ("max_viewers", "29")
        ]
        return CompleteStreamEvent("23 hours")
            .addPredefinedParameter(PredefinedFloat.REVENUE, float: 225522)
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createCompleteTrialEvent() -> Event {
        let data = [
            ("player", "ghost")
        ]
        return CompleteTrialEvent("time")
            .addPredefinedParameter(PredefinedString.REGISTRATION_METHOD, string: "SMS")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createCompleteTutorialEvent() -> Event {
        let data = [
            ("name", "intro")
        ]
        return CompleteTutorialEvent("intro")
            .addPredefinedParameter(PredefinedString.REGISTRATION_METHOD, string: "SMS")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createContentItemsViewEvent() -> Event {
        let data = [
            [("item", "book")],
            [("item", "guitar")]
        ]
        return ContentItemsViewEvent("personal")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: [("collection", "Greatest Hits")])
            .addPredefinedParameter(PredefinedString.CONTENT_ID, string: "2561")
            .addPredefinedParameter(PredefinedListObject.CONTENT_LIST, listObject: [[("content", "songs, videos")]])
            .addPredefinedParameter(PredefinedString.CONTENT_TYPE, string: "MATURE")
            .addPredefinedParameter(PredefinedString.CURRENCY, string: "USD")
            .addPredefinedParameter(PredefinedListObject.CONTENT_LIST, listObject: data)
    }
    
    func createCustomId01Event() -> Event {
        return CustomId01Event("custom")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
    }
    
    func createCustomId02Event() -> Event {
        return CustomId02Event("custom")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
    }
    
    func createCustomId03Event() -> Event {
        return CustomId03Event("custom")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
    }
    
    func createCustomId04Event() -> Event {
        return CustomId04Event("custom")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
    }
    
    func createCustomId05Event() -> Event {
        return CustomId05Event("custom")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
    }
    
    func createCustomId06Event() -> Event {
        return CustomId06Event("custom")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
    }
    
    func createCustomId07Event() -> Event {
        return CustomId07Event("custom")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
    }
    
    func createCustomId08Event() -> Event {
        return CustomId08Event("custom")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
    }
    
    func createCustomId09Event() -> Event {
        return CustomId09Event("custom")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
    }
    
    func createCustomId10Event() -> Event {
        return CustomId10Event("custom")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
    }
    
    func createDeepLinkedEvent() -> Event {
        let data = [
            ("isLinked", true)
        ]
        return DeepLinkedEvent("referrer: google")
            .addPredefinedParameter(PredefinedString.ADREV_AD_TYPE, string: "interstitial")
            .addPredefinedParameter(PredefinedString.REGION, string: "ASIA")
            .addPredefinedParameter(PredefinedString.CLASS, string: "student")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createInitiatePurchaseEvent() -> Event {
        let data = [
            ("payment", "card")
        ]
        return InitiatePurchaseEvent("best price")
            .addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            .addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            .addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createInitiateStreamEvent() -> Event {
        let data = [
            ("streamer", "car"),
            ("date", "02.03.2021")
        ]
        return InitiateStreamEvent("shooter")
            .addPredefinedParameter(PredefinedString.COUPON_CODE, string: "25XLKM")
            .addPredefinedParameter(PredefinedString.VIRTUAL_CURRENCY_NAME, string: "BTC")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createInviteEvent() -> Event {
        let data = [
            ("invitation", "mail"),
            ("date", "02.03.2021")
        ]
        return InviteEvent("dancing")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createLastAttributedTouchEvent() -> Event {
        let data: [(String, Any)] = [
            ("touchType", TouchType.CLICK.type),
            ("touchData", ("header", 2))
        ]
        return LastAttributedTouchEvent("tablet")
            .addPredefinedParameter(PredefinedString.SUBSCRIPTION_ID, string: "lasAK22")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createListViewEvent() -> Event {
        let data = [
            ("clothes", 2)
        ]
        return ListViewEvent("items")
            .addPredefinedParameter(PredefinedString.PAYMENT_INFO_AVAILABLE, string: "card")
            .addPredefinedParameter(PredefinedString.SEARCH_STRING, string: "best car wash")
            .addPredefinedParameter(PredefinedString.SUGGESTED_DESTINATIONS, string: "create, spain")
            .addPredefinedParameter(PredefinedString.SUGGESTED_HOTELS, string: "beach resort, marina spa")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createLoginEvent() -> Event {
        let data = [
            ("email", "cat@gmail.com")
        ]
        return LoginEvent("web")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createOpenedFromPushNotificationEvent() -> Event {
        return OpenedFromPushNotificationEvent("active")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
            .addPredefinedParameter(PredefinedString.DESCRIPTION, string: "silent")
        
    }

    func createOrderEvent() -> Event {
        return OrderEvent("apple")
            .addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            .addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            .addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
    }

    func createOrderItemAddedEvent() -> Event {
        return OrderItemAddedEvent("apple")
            .addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            .addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            .addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
    }

    func createOrderItemRemoveEvent() -> Event {
        return OrderItemRemoveEvent("apple")
            .addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            .addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            .addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
    }

    func createOrderCancelEvent() -> Event {
        return OrderCancelEvent("apple")
            .addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            .addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            .addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
    }

    func createOrderReturnRequestEvent() -> Event {
        return OrderReturnRequestEvent("apple")
            .addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            .addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            .addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
    }

    func createOrderReturnRequestCancelEvent() -> Event {
        return OrderReturnRequestCancelEvent("apple")
            .addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            .addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            .addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
    }
    
    func createPurchaseEvent() -> Event {
        let data = [
            ("phone", 1),
            ("case", 1)
        ]
        return PurchaseEvent("apple")
            .addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            .addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            .addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createRateEvent() -> Event {
        let data = [
            ("rating", 5)
        ]
        return RateEvent("no bugs")
            .addPredefinedParameter(PredefinedString.PREFERRED_NEIGHBORHOODS, string: "2")
            .addPredefinedParameter(PredefinedLong.PREFERRED_NUM_STOPS, long: 4)
            .addPredefinedParameter(PredefinedFloat.PREFERRED_PRICE_RANGE, float: 10.22)
            .addPredefinedParameter(PredefinedLong.PREFERRED_STAR_RATINGS, long: 6)
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createReEngageEvent() -> Event {
        return ReEngageEvent("web")
            .addPredefinedParameter(PredefinedString.CUSTOMER_USER_ID, string: "4")
        
    }
    
    func createReserveEvent() -> Event {
        let data = [
            ("ticket", "movie")
        ]
        let data2 = [
            ("food", "coke")
        ]
        return ReserveEvent("discount")
            .addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            .addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            .addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
            .addPredefinedParameter(PredefinedListObject.CONTENT_LIST, listObject: [data, data2])
    }
    
    func createSalesEvent() -> Event {
        let data = [
            ("phone", 1),
            ("case", 1)
        ]
        
        return SalesEvent("apple")
            .addPredefinedParameter(PredefinedString.ORDER_ID, string: "23123")
            .addPredefinedParameter(PredefinedFloat.PRICE, float: 2.19)
            .addPredefinedParameter(PredefinedLong.QUANTITY, long: 1)
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }

    func createSearchEvent() -> Event {
        let data = [
            ("search",["eco milk", "grass"])
        ]
        return SearchEvent("browser")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createShareEvent() -> Event {
        let data = [
            ("post_id", "252242"),
            ("post_img", "img.webp")
        ]
        
        return ShareEvent("telegram")
            .addPredefinedParameter(PredefinedString.RECEIPT_ID, string: "22")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
        
    }
    
    func createSpendCreditsEvent() -> Event {
        return SpendCreditsEvent("boosters")
            .addPredefinedParameter(PredefinedLong.AMOUNT, long: 2142)
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
    }
    
    func createStartRegistrationEvent() -> Event {
        let data = [
            ("time", "19:22:11")
        ]
        return StartRegistrationEvent("referrer")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createStartTrialEvent() -> Event {
        let data = [
            ("time", "19:22:11")
        ]
        return StartTrialEvent("30-days")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createStartTutorialEvent() -> Event {
        let data = [
            ("time", "19:22:11"),
            ("reward", "22")
        ]
        
        return StartTutorialEvent("video-feature")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createSubscribeEvent() -> Event {
        let data = [
            ("streamer", "cat")
        ]
        return SubscribeEvent("wire")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createTravelBookingEvent() -> Event {
        let data = ["may", "august"]
        return TravelBookingEvent("booking")
            .addPredefinedParameter(PredefinedLong.NUM_ADULTS, long: 1)
            .addPredefinedParameter(PredefinedLong.NUM_CHILDREN, long: 2)
            .addPredefinedParameter(PredefinedLong.NUM_INFANTS, long: 1)
            .addPredefinedParameter(PredefinedLong.DATE_A, long: 1609268400000)
            .addPredefinedParameter(PredefinedLong.DATE_B, long: 1609441200000)
            .addPredefinedParameter(PredefinedLong.DEPARTING_ARRIVAL_DATE, long: 1609441200000)
            .addPredefinedParameter(PredefinedLong.DEPARTING_DEPARTURE_DATE, long: 1609268400000)
            .addPredefinedParameter(PredefinedString.DESTINATION_A, string: "usa")
            .addPredefinedParameter(PredefinedString.DESTINATION_B, string: "mexico")
            .addPredefinedParameter(PredefinedString.DESTINATION_LIST, string: "usa, mexico")
            .addPredefinedParameter(PredefinedLong.HOTEL_SCORE, long: 5)
            .addPredefinedParameter(PredefinedLong.TRAVEL_START, long: 1606762800000)
            .addPredefinedParameter(PredefinedLong.TRAVEL_END, long: 1638298800000)
            .addPredefinedParameter(PredefinedObject.CONTENT, object: [("data", data)])
    }
    
    func createUnlockAchievementEvent() -> Event {
        let data = [
            ("achievement", "new level")
        ]
        return UnlockAchievementEvent("best damage")
            .addPredefinedParameter(PredefinedLong.USER_SCORE, long: 12552)
            .addPredefinedParameter(PredefinedString.ACHIEVEMENT_ID, string: "1334-1225-ASDZ")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createUnsubscribeEvent() -> Event {
        let data = [
            ("reason", "span")
        ]
        return UnsubscribeEvent("02.01.2021")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createUpdateEvent() -> Event {
        let data = ["com.facebook"]
        return UpdateEvent("firmware")
            .addPredefinedParameter(PredefinedLong.EVENT_START, long: 1612119600000)
            .addPredefinedParameter(PredefinedLong.EVENT_END, long: 1640977200000)
            .addPredefinedParameter(PredefinedString.NEW_VERSION, string: "8")
            .addPredefinedParameter(PredefinedString.OLD_VERSION, string: "1.8")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: [("details", data)])
    }
    
    func createViewAdvEvent() -> Event {
        let data = [
            ("source", "amazon")
        ]
        return ViewAdvEvent("skip")
            .addPredefinedParameter(PredefinedLong.RETURNING_ARRIVAL_DATE, long: 1638298800000)
            .addPredefinedParameter(PredefinedLong.RETURNING_DEPARTURE_DATE, long: 1669834800000)
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createViewCartEvent() -> Event {
        let data = [
            ("cart_value", "25.22$"),
            ("cart_items", "2")
        ]
        return ViewCartEvent("main")
            .addPredefinedParameter(PredefinedString.PARAM_01, string: "param1")
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createViewItemEvent() -> Event {
        let data = [
            ("section_name", "header")
        ]
        return ViewItemEvent("main")
            .addPredefinedParameter(PredefinedLong.MAX_RATING_VALUE, long: 5)
            .addPredefinedParameter(PredefinedLong.RATING_VALUE, long: 9)
            .addPredefinedParameter(PredefinedObject.CONTENT, object: data)
    }
    
    func createViewItemsEvent() -> Event {
        let data = [[("section_name", "header")],
                    [("section_name", "section-1")],
                    [("section_name", "section-2")],
                    [("section_name", "footer")]
        ]
        return ViewItemsEvent("main")
            .addPredefinedParameter(PredefinedLong.MAX_RATING_VALUE, long: 5)
            .addPredefinedParameter(PredefinedLong.RATING_VALUE, long: 9)
            .addPredefinedParameter(PredefinedListObject.CONTENT_LIST, listObject: data)
    }
}
