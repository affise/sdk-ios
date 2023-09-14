import AffiseAttributionLib

internal class PredefinedEventSecondary {
    
    static func isSecondaryConstructor(_ eventName: String?, map: [String:Any?]) -> Bool {
        if let data: Any? = map.getPropertyByKey(), data != nil { return true }
        if eventName != EventName.LAST_ATTRIBUTED_TOUCH.eventName { return false }
        if let _: Any = map.getPropertyByKey(AffiseProperty.TYPE.rawValue) { return true }
        
        return false
    }
    
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
        case .ACHIEVE_LEVEL:
            return AchieveLevelEvent(level: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .ADD_PAYMENT_INFO:
            return AddPaymentInfoEvent(paymentInfo: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .ADD_TO_CART:
            return AddToCartEvent(addToCartObject: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .ADD_TO_WISHLIST:
            return AddToWishlistEvent(wishList: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .CLICK_ADV:
            return ClickAdvEvent(advertisement: map.getSerializeString(), timeStampMillis: timeStamp, userData: userData)
        case .COMPLETE_REGISTRATION:
            return CompleteRegistrationEvent(registration: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .COMPLETE_STREAM:
            return CompleteStreamEvent(stream: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .COMPLETE_TRIAL:
            return CompleteTrialEvent(trial: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .COMPLETE_TUTORIAL:
            return CompleteTutorialEvent(tutorial: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .CONTENT_ITEMS_VIEW:
            return ContentItemsViewEvent(objects: map.getSerializeArrayOfObject(), userData: userData)
        case .CUSTOM_ID_01:
            return CustomId01Event(custom: map.getSerializeString(), timeStampMillis: timeStamp, userData: userData)
        case .CUSTOM_ID_02:
            return CustomId02Event(custom: map.getSerializeString(), timeStampMillis: timeStamp, userData: userData)
        case .CUSTOM_ID_03:
            return CustomId03Event(custom: map.getSerializeString(), timeStampMillis: timeStamp, userData: userData)
        case .CUSTOM_ID_04:
            return CustomId04Event(custom: map.getSerializeString(), timeStampMillis: timeStamp, userData: userData)
        case .CUSTOM_ID_05:
            return CustomId05Event(custom: map.getSerializeString(), timeStampMillis: timeStamp, userData: userData)
        case .CUSTOM_ID_06:
            return CustomId06Event(custom: map.getSerializeString(), timeStampMillis: timeStamp, userData: userData)
        case .CUSTOM_ID_07:
            return CustomId07Event(custom: map.getSerializeString(), timeStampMillis: timeStamp, userData: userData)
        case .CUSTOM_ID_08:
            return CustomId08Event(custom: map.getSerializeString(), timeStampMillis: timeStamp, userData: userData)
        case .CUSTOM_ID_09:
            return CustomId09Event(custom: map.getSerializeString(), timeStampMillis: timeStamp, userData: userData)
        case .CUSTOM_ID_10:
            return CustomId10Event(custom: map.getSerializeString(), timeStampMillis: timeStamp, userData: userData)
        case .DEEP_LINKED:
            return DeepLinkedEvent(isLinked: map.getSerializeBool(), userData: userData)
        case .INITIATE_PURCHASE:
            return InitiatePurchaseEvent(purchaseData: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .INITIATE_STREAM:
            return InitiateStreamEvent(stream: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .INVITE:
            return InviteEvent(invite: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case EventName.LAST_ATTRIBUTED_TOUCH:
            let typeName = map.getSerializeString(AffiseProperty.TYPE.rawValue)
            let touchType = TouchType.from(typeName) ?? TouchType.CLICK
            let touchData = map.getSerializeObject(AffiseProperty.DATA.rawValue)
            return LastAttributedTouchEvent(touchType: touchType, timeStampMillis: timeStamp, touchData: touchData, userData: userData)
        case .LIST_VIEW:
            return ListViewEvent(list: map.getSerializeObject(), userData: userData)
        case .LOGIN:
            return LoginEvent(login: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .OPENED_FROM_PUSH_NOTIFICATION:
            return OpenedFromPushNotificationEvent(details: map.getSerializeString(), userData: userData)
        case .PURCHASE:
            return PurchaseEvent(purchaseData: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .RATE:
            return RateEvent(rate: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .RE_ENGAGE:
            return ReEngageEvent(reEngage: map.getSerializeString(), userData: userData)
        case .RESERVE:
            return ReserveEvent(reserve: map.getSerializeArrayOfObject(), timeStampMillis: timeStamp, userData: userData)
        case .SALES:
            return SalesEvent(salesData: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .SEARCH:
            return SearchEvent(search: map.getSerializeArrayOfAny(), timeStampMillis: timeStamp, userData: userData)
        case .SHARE:
            return ShareEvent(share: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .SPEND_CREDITS:
            return SpendCreditsEvent(credits: map.getSerializeLong(), timeStampMillis: timeStamp, userData: userData)
        case .START_REGISTRATION:
            return StartRegistrationEvent(registration: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .START_TRIAL:
            return StartTrialEvent(trial: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .START_TUTORIAL:
            return StartTutorialEvent(tutorial: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .SUBSCRIBE:
            return SubscribeEvent(subscribe: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .TRAVEL_BOOKING:
            return TravelBookingEvent(details: map.getSerializeArrayOfAny(), userData: userData)
        case .UNLOCK_ACHIEVEMENT:
            return UnlockAchievementEvent(achievement: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .UNSUBSCRIBE:
            return UnsubscribeEvent(unsubscribe: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .UPDATE:
            return UpdateEvent(details: map.getSerializeArrayOfAny(), userData: userData)
        case .VIEW_ADV:
            return ViewAdvEvent(ad: map.getSerializeObject(), timeStampMillis: timeStamp, userData: userData)
        case .VIEW_CART:
            return ViewCartEvent(objects: map.getSerializeObject(), userData: userData)
        case .VIEW_ITEM:
            return ViewItemEvent(item: map.getSerializeObject(), userData: userData)
        case .VIEW_ITEMS:
            return ViewItemsEvent(items: map.getSerializeArrayOfAny(), userData: userData)
            
        case .CONTACT:
            return ContactEvent(userData, timeStampMillis: timeStamp)
        case .CUSTOMIZE_PRODUCT:
            return CustomizeProductEvent(userData, timeStampMillis: timeStamp)
        case .DONATE:
            return DonateEvent(userData, timeStampMillis: timeStamp)
        case .FIND_LOCATION:
            return FindLocationEvent(userData, timeStampMillis: timeStamp)
        case .INITIATE_CHECKOUT:
            return InitiateCheckoutEvent(userData, timeStampMillis: timeStamp)
        case .LEAD:
            return LeadEvent(userData, timeStampMillis: timeStamp)
        case .SCHEDULE:
            return ScheduleEvent(userData, timeStampMillis: timeStamp)
        case .SUBMIT_APPLICATION:
            return SubmitApplicationEvent(userData, timeStampMillis: timeStamp)
        case .VIEW_CONTENT:
            return ViewContentEvent(userData, timeStampMillis: timeStamp)

        case .ORDER:
            return OrderEvent(userData, timeStampMillis: timeStamp)
        case .ORDER_CANCEL: 
            return OrderCancelEvent(userData, timeStampMillis: timeStamp)
        case .ORDER_RETURN_REQUEST: 
            return OrderReturnRequestEvent(userData, timeStampMillis: timeStamp)
        case .ORDER_RETURN_REQUEST_CANCEL: 
            return OrderReturnRequestCancelEvent(userData, timeStampMillis: timeStamp)
        case .AD_REVENUE:
            return AdRevenueEvent(userData, timeStampMillis: timeStamp)
        case .ORDER_ITEM_ADDED:
            return OrderItemAddedEvent(userData, timeStampMillis: timeStamp)
        case .ORDER_ITEM_REMOVE:
            return OrderItemRemoveEvent(userData, timeStampMillis: timeStamp)
        }
    }
}
