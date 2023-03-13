import Foundation

internal func classOfEvent(_ map: [String: Any?]) -> Event.Type? {
    let name = map[Parameters.AFFISE_EVENT_NAME] as? String
    let subtype = (map[Parameters.AFFISE_EVENT_DATA] as? [String: Any?])?[SubscriptionParameters.AFFISE_SUBSCRIPTION_EVENT_TYPE_KEY.rawValue] as? String
    
    switch name {
        case "AchieveLevel": return AchieveLevelEvent.self
        case "AddPaymentInfo": return AddPaymentInfoEvent.self
        case "AddToCart": return AddToCartEvent.self
        case "AddToWishlist": return AddToWishlistEvent.self
        case "ClickAdv": return ClickAdvEvent.self
        case "CompleteRegistration": return CompleteRegistrationEvent.self
        case "CompleteStream": return CompleteStreamEvent.self
        case "CompleteTrial": return CompleteTrialEvent.self
        case "CompleteTutorial": return CompleteTutorialEvent.self
        case "ContentItemsView": return ContentItemsViewEvent.self
        case "CustomId01": return CustomId01Event.self
        case "CustomId02": return CustomId02Event.self
        case "CustomId03": return CustomId03Event.self
        case "CustomId04": return CustomId04Event.self
        case "CustomId05": return CustomId05Event.self
        case "CustomId06": return CustomId06Event.self
        case "CustomId07": return CustomId07Event.self
        case "CustomId08": return CustomId08Event.self
        case "CustomId09": return CustomId09Event.self
        case "CustomId10": return CustomId10Event.self
        case "DeepLinked": return DeepLinkedEvent.self
        case "InitiatePurchase": return InitiatePurchaseEvent.self
        case "InitiateStream": return InitiateStreamEvent.self
        case "Invite": return InviteEvent.self
        case "LastAttributedTouch": return LastAttributedTouchEvent.self
        case "ListView": return ListViewEvent.self
        case "Login": return LoginEvent.self
        case "OpenedFromPushNotification": return OpenedFromPushNotificationEvent.self
        case "Purchase": return PurchaseEvent.self
        case "Rate": return RateEvent.self
        case "ReEngage": return ReEngageEvent.self
        case "Reserve": return ReserveEvent.self
        case "Sales": return SalesEvent.self
        case "Search": return SearchEvent.self
        case "Share": return ShareEvent.self
        case "SpendCredits": return SpendCreditsEvent.self
        case "StartRegistration": return StartRegistrationEvent.self
        case "StartTrial": return StartTrialEvent.self
        case "StartTutorial": return StartTutorialEvent.self
        case "Subscribe": return SubscribeEvent.self
        case "TravelBooking": return TravelBookingEvent.self
        case "UnlockAchievement": return UnlockAchievementEvent.self
        case "Unsubscribe": return UnsubscribeEvent.self
        case "Update": return UpdateEvent.self
        case "ViewAdv": return ViewAdvEvent.self
        case "ViewCart": return ViewCartEvent.self
        case "ViewItem": return ViewItemEvent.self
        case "ViewItems": return ViewItemsEvent.self
        case SubscriptionParameters.AFFISE_UNSUBSCRIPTION.rawValue: return subscriptionEventClass(subtype)
        case SubscriptionParameters.AFFISE_SUBSCRIPTION_ACTIVATION.rawValue: return subscriptionEventClass(subtype)
        case SubscriptionParameters.AFFISE_SUBSCRIPTION_CANCELLATION.rawValue: return subscriptionEventClass(subtype)
        case SubscriptionParameters.AFFISE_SUBSCRIPTION_ENTERED_BILLING_RETRY.rawValue: return subscriptionEventClass(subtype)
        case SubscriptionParameters.AFFISE_SUBSCRIPTION_FIRST_CONVERSION.rawValue: return subscriptionEventClass(subtype)
        case SubscriptionParameters.AFFISE_SUBSCRIPTION_REACTIVATION.rawValue: return subscriptionEventClass(subtype)
        case SubscriptionParameters.AFFISE_SUBSCRIPTION_RENEWAL.rawValue: return subscriptionEventClass(subtype)
        case SubscriptionParameters.AFFISE_SUBSCRIPTION_RENEWAL_FROM_BILLING_RETRY.rawValue: return subscriptionEventClass(subtype)
        
        default:
            return nil
    }
}

private func subscriptionEventClass(_ subtype: String?) -> Event.Type? {
    switch subtype {
        case SubscriptionParameters.AFFISE_SUB_INITIAL_SUBSCRIPTION.rawValue: return InitialSubscriptionEvent.self
        case SubscriptionParameters.AFFISE_SUB_INITIAL_TRIAL.rawValue: return InitialTrialEvent.self
        case SubscriptionParameters.AFFISE_SUB_INITIAL_OFFER.rawValue: return InitialOfferEvent.self
        case SubscriptionParameters.AFFISE_SUB_FAILED_TRIAL.rawValue: return FailedTrialEvent.self
        case SubscriptionParameters.AFFISE_SUB_FAILED_OFFERISE.rawValue: return FailedOfferiseEvent.self
        case SubscriptionParameters.AFFISE_SUB_FAILED_SUBSCRIPTION.rawValue: return FailedSubscriptionEvent.self
        case SubscriptionParameters.AFFISE_SUB_FAILED_TRIAL_FROM_RETRY.rawValue: return FailedTrialFromRetryEvent.self
        case SubscriptionParameters.AFFISE_SUB_FAILED_OFFER_FROM_RETRY.rawValue: return FailedOfferFromRetryEvent.self
        case SubscriptionParameters.AFFISE_SUB_FAILED_SUBSCRIPTION_FROM_RETRY.rawValue: return FailedSubscriptionFromRetryEvent.self
        case SubscriptionParameters.AFFISE_SUB_TRIAL_IN_RETRY.rawValue: return TrialInRetryEvent.self
        case SubscriptionParameters.AFFISE_SUB_OFFER_IN_RETRY.rawValue: return OfferInRetryEvent.self
        case SubscriptionParameters.AFFISE_SUB_SUBSCRIPTION_IN_RETRY.rawValue: return SubscriptionInRetryEvent.self
        case SubscriptionParameters.AFFISE_SUB_CONVERTED_TRIAL.rawValue: return ConvertedTrialEvent.self
        case SubscriptionParameters.AFFISE_SUB_CONVERTED_OFFER.rawValue: return ConvertedOfferEvent.self
        case SubscriptionParameters.AFFISE_SUB_REACTIVATED_SUBSCRIPTION.rawValue: return ReactivatedSubscriptionEvent.self
        case SubscriptionParameters.AFFISE_SUB_RENEWED_SUBSCRIPTION.rawValue: return RenewedSubscriptionEvent.self
        case SubscriptionParameters.AFFISE_SUB_CONVERTED_TRIAL_FROM_RETRY.rawValue: return ConvertedTrialFromRetryEvent.self
        case SubscriptionParameters.AFFISE_SUB_CONVERTED_OFFER_FROM_RETRY.rawValue: return ConvertedOfferFromRetryEvent.self
        case SubscriptionParameters.AFFISE_SUB_RENEWED_SUBSCRIPTION_FROM_RETRY.rawValue: return RenewedSubscriptionFromRetryEvent.self
        case SubscriptionParameters.AFFISE_SUB_UNSUBSCRIPTION.rawValue: return UnsubscriptionEvent.self
        
        default:
            return nil
    }
}
