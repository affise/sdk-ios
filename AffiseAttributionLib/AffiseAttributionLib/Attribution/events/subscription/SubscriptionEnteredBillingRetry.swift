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
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_ENTERED_BILLING_RETRY.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_TRIAL_IN_RETRY.rawValue }
}

/**
 * Event OfferInRetry use [data] of event and [userData]
 */
@objc
public class OfferInRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_ENTERED_BILLING_RETRY.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_OFFER_IN_RETRY.rawValue }
}

/**
 * Event SubscriptionInRetry use [data] of event and [userData]
 */
@objc
public class SubscriptionInRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_ENTERED_BILLING_RETRY.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_SUBSCRIPTION_IN_RETRY.rawValue }
}
