//
//  FailedTrialEvent.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event FailedTrial use [data] of event and [userData]
 */
@objc
public class FailedTrialEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_CANCELLATION.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_FAILED_TRIAL.rawValue }
}

/**
 * Event FailedOfferise use [data] of event and [userData]
 */
@objc
public class FailedOfferiseEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_CANCELLATION.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_FAILED_OFFERISE.rawValue }
}

/**
 * Event FailedSubscription use [data] of event and [userData]
 */
@objc
public class FailedSubscriptionEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_CANCELLATION.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_FAILED_SUBSCRIPTION.rawValue }
}

/**
 * Event FailedTrialFromRetry use [data] of event and [userData]
 */
@objc
public class FailedTrialFromRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_CANCELLATION.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_FAILED_TRIAL_FROM_RETRY.rawValue }
}

/**
 * Event FailedOfferFromRetry use [data] of event and [userData]
 */
@objc
public class FailedOfferFromRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_CANCELLATION.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_FAILED_OFFER_FROM_RETRY.rawValue }
}

/**
 * Event FailedSubscriptionFromRetry use [data] of event and [userData]
 */
@objc
public class FailedSubscriptionFromRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_CANCELLATION.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_FAILED_SUBSCRIPTION_FROM_RETRY.rawValue }
}
