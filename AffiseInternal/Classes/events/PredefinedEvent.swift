import AffiseAttributionLib

internal class PredefinedEvent {
    static func create(_ name: String?, map: [String: Any?]) -> Event? {
        guard let name = name else {
            return nil
        }
        
        guard let eventName = EventName.from(name) else {
            return nil
        }

        let timeStamp = map.getTimeStamp() ?? timestamp()
        let userData = map.getUserData()

        switch eventName {
        case .ACHIEVE_LEVEL: return AchieveLevelEvent(userData, timeStampMillis: timeStamp)
        case .ADD_PAYMENT_INFO: return AddPaymentInfoEvent(userData, timeStampMillis: timeStamp)
        case .ADD_TO_CART: return AddToCartEvent(userData, timeStampMillis: timeStamp)
        case .ADD_TO_WISHLIST: return AddToWishlistEvent(userData, timeStampMillis: timeStamp)
        case .CLICK_ADV: return ClickAdvEvent(userData, timeStampMillis: timeStamp)
        case .COMPLETE_REGISTRATION: return CompleteRegistrationEvent(userData, timeStampMillis: timeStamp)
        case .COMPLETE_STREAM: return CompleteStreamEvent(userData, timeStampMillis: timeStamp)
        case .COMPLETE_TRIAL: return CompleteTrialEvent(userData, timeStampMillis: timeStamp)
        case .COMPLETE_TUTORIAL: return CompleteTutorialEvent(userData, timeStampMillis: timeStamp)
        case .CONTENT_ITEMS_VIEW: return ContentItemsViewEvent(userData, timeStampMillis: timeStamp)
        case .CUSTOM_ID_01: return CustomId01Event(userData, timeStampMillis: timeStamp)
        case .CUSTOM_ID_02: return CustomId02Event(userData, timeStampMillis: timeStamp)
        case .CUSTOM_ID_03: return CustomId03Event(userData, timeStampMillis: timeStamp)
        case .CUSTOM_ID_04: return CustomId04Event(userData, timeStampMillis: timeStamp)
        case .CUSTOM_ID_05: return CustomId05Event(userData, timeStampMillis: timeStamp)
        case .CUSTOM_ID_06: return CustomId06Event(userData, timeStampMillis: timeStamp)
        case .CUSTOM_ID_07: return CustomId07Event(userData, timeStampMillis: timeStamp)
        case .CUSTOM_ID_08: return CustomId08Event(userData, timeStampMillis: timeStamp)
        case .CUSTOM_ID_09: return CustomId09Event(userData, timeStampMillis: timeStamp)
        case .CUSTOM_ID_10: return CustomId10Event(userData, timeStampMillis: timeStamp)
        case .DEEP_LINKED: return DeepLinkedEvent(userData, timeStampMillis: timeStamp)
        case .INITIATE_PURCHASE: return InitiatePurchaseEvent(userData, timeStampMillis: timeStamp)
        case .INITIATE_STREAM: return InitiateStreamEvent(userData, timeStampMillis: timeStamp)
        case .INVITE: return InviteEvent(userData, timeStampMillis: timeStamp)
        case .LAST_ATTRIBUTED_TOUCH: return LastAttributedTouchEvent(userData, timeStampMillis: timeStamp)
        case .LIST_VIEW: return ListViewEvent(userData, timeStampMillis: timeStamp)
        case .LOGIN: return LoginEvent(userData, timeStampMillis: timeStamp)
        case .OPENED_FROM_PUSH_NOTIFICATION: return OpenedFromPushNotificationEvent(userData, timeStampMillis: timeStamp)
        case .PURCHASE: return PurchaseEvent(userData, timeStampMillis: timeStamp)
        case .RATE: return RateEvent(userData, timeStampMillis: timeStamp)
        case .RE_ENGAGE: return ReEngageEvent(userData, timeStampMillis: timeStamp)
        case .RESERVE: return ReserveEvent(userData, timeStampMillis: timeStamp)
        case .SALES: return SalesEvent(userData, timeStampMillis: timeStamp)
        case .SEARCH: return SearchEvent(userData, timeStampMillis: timeStamp)
        case .SHARE: return ShareEvent(userData, timeStampMillis: timeStamp)
        case .SPEND_CREDITS: return SpendCreditsEvent(userData, timeStampMillis: timeStamp)
        case .START_REGISTRATION: return StartRegistrationEvent(userData, timeStampMillis: timeStamp)
        case .START_TRIAL: return StartTrialEvent(userData, timeStampMillis: timeStamp)
        case .START_TUTORIAL: return StartTutorialEvent(userData, timeStampMillis: timeStamp)
        case .SUBSCRIBE: return SubscribeEvent(userData, timeStampMillis: timeStamp)
        case .TRAVEL_BOOKING: return TravelBookingEvent(userData, timeStampMillis: timeStamp)
        case .UNLOCK_ACHIEVEMENT: return UnlockAchievementEvent(userData, timeStampMillis: timeStamp)
        case .UNSUBSCRIBE: return UnsubscribeEvent(userData, timeStampMillis: timeStamp)
        case .UPDATE: return UpdateEvent(userData, timeStampMillis: timeStamp)
        case .VIEW_ADV: return ViewAdvEvent(userData, timeStampMillis: timeStamp)
        case .VIEW_CART: return ViewCartEvent(userData, timeStampMillis: timeStamp)
        case .VIEW_ITEM: return ViewItemEvent(userData, timeStampMillis: timeStamp)
        case .VIEW_ITEMS: return ViewItemsEvent(userData, timeStampMillis: timeStamp)
        
        case .CONTACT: return ContactEvent(userData, timeStampMillis: timeStamp)
        case .CUSTOMIZE_PRODUCT: return CustomizeProductEvent(userData, timeStampMillis: timeStamp)
        case .DONATE: return DonateEvent(userData, timeStampMillis: timeStamp)
        case .FIND_LOCATION: return FindLocationEvent(userData, timeStampMillis: timeStamp)
        case .INITIATE_CHECKOUT: return InitiateCheckoutEvent(userData, timeStampMillis: timeStamp)
        case .LEAD: return LeadEvent(userData, timeStampMillis: timeStamp)
        case .SCHEDULE: return ScheduleEvent(userData, timeStampMillis: timeStamp)
        case .SUBMIT_APPLICATION: return SubmitApplicationEvent(userData, timeStampMillis: timeStamp)
        case .VIEW_CONTENT: return ViewContentEvent(userData, timeStampMillis: timeStamp)

        case .ORDER: return OrderEvent(userData, timeStampMillis: timeStamp)
        case .ORDER_CANCEL: return OrderCancelEvent(userData, timeStampMillis: timeStamp)
        case .ORDER_RETURN_REQUEST: return OrderReturnRequestEvent(userData, timeStampMillis: timeStamp)
        case .ORDER_RETURN_REQUEST_CANCEL: return OrderReturnRequestCancelEvent(userData, timeStampMillis: timeStamp)
        case .AD_REVENUE: return AdRevenueEvent(userData, timeStampMillis: timeStamp)
        case .ORDER_ITEM_ADDED: return OrderItemAddedEvent(userData, timeStampMillis: timeStamp)
        case .ORDER_ITEM_REMOVE: return OrderItemRemoveEvent(userData, timeStampMillis: timeStamp)
        }
    }
}
