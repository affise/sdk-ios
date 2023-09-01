//
//  ConvertedTrialEvent.swift
//  AffiseAttributionLib
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
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_FIRST_CONVERSION }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_CONVERTED_TRIAL }
}

/**
 * Event ConvertedOffer use [data] of event and [userData]
 */
@objc
public class ConvertedOfferEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> SubscriptionEventName { return SubscriptionEventName.AFFISE_SUBSCRIPTION_FIRST_CONVERSION }

    /**
     * Subtype of event
     */
    public override func subtype() -> SubscriptionSubType { return SubscriptionSubType.AFFISE_SUB_CONVERTED_OFFER }
}
