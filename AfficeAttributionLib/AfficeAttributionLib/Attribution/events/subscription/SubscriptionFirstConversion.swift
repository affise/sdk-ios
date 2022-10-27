//
//  ConvertedTrialEvent.swift
//  AfficeAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event ConvertedTrial use [data] of event and [userData]
 */
@objc
public class ConvertedTrialEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_FIRST_CONVERSION.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_CONVERTED_TRIAL.rawValue }
}

/**
 * Event ConvertedOffer use [data] of event and [userData]
 */
@objc
public class ConvertedOfferEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_FIRST_CONVERSION.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_CONVERTED_OFFER.rawValue }
}
