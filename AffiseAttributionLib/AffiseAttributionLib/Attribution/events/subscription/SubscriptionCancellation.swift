//
//  FailedTrialEvent.swift
//  AffiseAttributionLib
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
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_CANCELLATION }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_FAILED_TRIAL }
}

/**
 * Event FailedOfferise use [data] of event and [userData]
 */
@objc
public class FailedOfferiseEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_CANCELLATION }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_FAILED_OFFERISE }
}

/**
 * Event FailedSubscription use [data] of event and [userData]
 */
@objc
public class FailedSubscriptionEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_CANCELLATION }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_FAILED_SUBSCRIPTION }
}

/**
 * Event FailedTrialFromRetry use [data] of event and [userData]
 */
@objc
public class FailedTrialFromRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_CANCELLATION }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_FAILED_TRIAL_FROM_RETRY }
}

/**
 * Event FailedOfferFromRetry use [data] of event and [userData]
 */
@objc
public class FailedOfferFromRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_CANCELLATION }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_FAILED_OFFER_FROM_RETRY }
}

/**
 * Event FailedSubscriptionFromRetry use [data] of event and [userData]
 */
@objc
public class FailedSubscriptionFromRetryEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_CANCELLATION }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_FAILED_SUBSCRIPTION_FROM_RETRY }
}
