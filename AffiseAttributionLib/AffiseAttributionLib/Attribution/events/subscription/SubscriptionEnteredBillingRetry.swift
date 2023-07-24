//
//  TrialInRetryEvent.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event TrialInRetry use [data] of event and [userData]
 */
@objc
public class TrialInRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_ENTERED_BILLING_RETRY }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_TRIAL_IN_RETRY }
}

/**
 * Event OfferInRetry use [data] of event and [userData]
 */
@objc
public class OfferInRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_ENTERED_BILLING_RETRY }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_OFFER_IN_RETRY }
}

/**
 * Event SubscriptionInRetry use [data] of event and [userData]
 */
@objc
public class SubscriptionInRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_ENTERED_BILLING_RETRY }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_SUBSCRIPTION_IN_RETRY }
}
