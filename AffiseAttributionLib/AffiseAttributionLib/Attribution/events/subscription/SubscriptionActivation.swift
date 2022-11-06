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
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_ACTIVATION.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_INITIAL_SUBSCRIPTION.rawValue }
}

/**
 * Event InitialTrial use [data] of event and [userData]
 */
@objc
public class InitialTrialEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_ACTIVATION.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_INITIAL_TRIAL.rawValue }
}

/**
 * Event of InitialOffer use [data] of event and [userData]
 */
@objc
public class InitialOfferEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_ACTIVATION.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_INITIAL_OFFER.rawValue }
}
