//
//  RenewedSubscriptionEvent.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Event RenewedSubscription use [data] of event and [userData]
 */
@objc
public class RenewedSubscriptionEvent : BaseSubscriptionEvent {

    /**
     * Type of event
     */
    override func type() -> String { return SubscriptionParameters.AFFISE_SUBSCRIPTION_RENEWAL.rawValue }

    /**
     * Subtype of event
     */
    public override func subtype() -> String { return SubscriptionParameters.AFFISE_SUB_RENEWED_SUBSCRIPTION.rawValue }
}
