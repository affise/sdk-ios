import AffiseAttributionLib

internal class SubscriptionEvent {
    static func create(_ eventName: String?, subName: String?, map: [String: Any?]) -> Event? {
        guard let name = subName else {
            return nil
        }
        
        let userData = map.getUserData()
        var dataMap = map.getEventData()
        let data = dataMap.removeSubtypeFields(eventName).toArray()

        guard let subType = SubscriptionSubType.from(name) else {
            return nil
        }

        switch subType {
        case .AFFISE_SUB_INITIAL_SUBSCRIPTION:
            return InitialSubscriptionEvent(data: data, userData: userData)
        case .AFFISE_SUB_INITIAL_TRIAL:
            return InitialTrialEvent(data: data, userData: userData)
        case .AFFISE_SUB_INITIAL_OFFER:
            return InitialOfferEvent(data: data, userData: userData)
        case .AFFISE_SUB_FAILED_TRIAL:
            return FailedTrialEvent(data: data, userData: userData)
        case .AFFISE_SUB_FAILED_OFFERISE:
            return FailedOfferiseEvent(data: data, userData: userData)
        case .AFFISE_SUB_FAILED_SUBSCRIPTION:
            return FailedSubscriptionEvent(data: data, userData: userData)
        case .AFFISE_SUB_FAILED_TRIAL_FROM_RETRY:
            return FailedTrialFromRetryEvent(data: data, userData: userData)
        case .AFFISE_SUB_FAILED_OFFER_FROM_RETRY:
            return FailedOfferFromRetryEvent(data: data, userData: userData)
        case .AFFISE_SUB_FAILED_SUBSCRIPTION_FROM_RETRY:
            return FailedSubscriptionFromRetryEvent(data: data, userData: userData)
        case .AFFISE_SUB_TRIAL_IN_RETRY:
            return TrialInRetryEvent(data: data, userData: userData)
        case .AFFISE_SUB_OFFER_IN_RETRY:
            return OfferInRetryEvent(data: data, userData: userData)
        case .AFFISE_SUB_SUBSCRIPTION_IN_RETRY:
            return SubscriptionInRetryEvent(data: data, userData: userData)
        case .AFFISE_SUB_CONVERTED_TRIAL:
            return ConvertedTrialEvent(data: data, userData: userData)
        case .AFFISE_SUB_CONVERTED_OFFER:
            return ConvertedOfferEvent(data: data, userData: userData)
        case .AFFISE_SUB_REACTIVATED_SUBSCRIPTION:
            return ReactivatedSubscriptionEvent(data: data, userData: userData)
        case .AFFISE_SUB_RENEWED_SUBSCRIPTION:
            return RenewedSubscriptionEvent(data: data, userData: userData)
        case .AFFISE_SUB_CONVERTED_TRIAL_FROM_RETRY:
            return ConvertedTrialFromRetryEvent(data: data, userData: userData)
        case .AFFISE_SUB_CONVERTED_OFFER_FROM_RETRY:
            return ConvertedOfferFromRetryEvent(data: data, userData: userData)
        case .AFFISE_SUB_RENEWED_SUBSCRIPTION_FROM_RETRY:
            return RenewedSubscriptionFromRetryEvent(data: data, userData: userData)
        case .AFFISE_SUB_UNSUBSCRIPTION:
            return UnsubscriptionEvent(data: data, userData: userData)
        }
    }
}
