//
//  InitialSubscriptionEvent.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event InitialSubscription use [data] of event and [userData]
 */
@objc
public class InitialSubscriptionEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_ACTIVATION }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_INITIAL_SUBSCRIPTION }
}

/**
 * Event InitialTrial use [data] of event and [userData]
 */
@objc
public class InitialTrialEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_ACTIVATION }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_INITIAL_TRIAL }
}

/**
 * Event of InitialOffer use [data] of event and [userData]
 */
@objc
public class InitialOfferEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_ACTIVATION }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_INITIAL_OFFER }
}
