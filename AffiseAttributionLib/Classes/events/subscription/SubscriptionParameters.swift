//
//  SubscriptionParameters.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//

/**
 * Subscription events parameters - key of parameter
 */
public enum SubscriptionParameters: String {
    case AFFISE_SUBSCRIPTION_EVENT_TYPE_KEY = "affise_event_type"
}

extension SubscriptionParameters: CaseIterable {
    public static func from(_ name: String) -> SubscriptionParameters? {
        return allCases.first { name == $0.rawValue }
    }
}
