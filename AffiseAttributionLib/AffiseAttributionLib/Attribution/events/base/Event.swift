//
//  Event.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation


/**
 * Base event
 */

@objc
public class Event: NSObject {

    /**
     * Event predefined parameters
     */
    private(set) var predefinedParameters: [(String, Any?)] = []

    /**
     * Is first for user, default false
     */
    private var firstForUser: Bool = false

    /**
     * Serialize event to Dictionary
     *
     * @return Dictionary
     */
    func serialize() -> [(String, Any?)] { return [] }

    /**
     * Name of event
     *
     * @return name
     */
    public func getName() -> String { return "" }

    /**
     * Category of event
     *
     * @return category
     */
    func getCategory() -> String { return "" }

    /**
     * User data
     *
     * @return userData
     */
    func getUserData() -> String? { return nil }

    /**
     * Is first for user, default false
     *
     * @return is first for user or not
     */
    func isFirstForUser() -> Bool { return firstForUser }

    func setFirstForUser(_ firstForUser: Bool) {
        self.firstForUser = firstForUser
    }

    /**
     * Add predefined [parameter] with [value] to event
     */
    @objc
    public func addPredefinedParameter(parameter: PredefinedParameters, value: Any?) {
        var predefined: String = ""
        switch parameter {
        case .ADREV_AD_TYPE:
            predefined = "affise_p_adrev_ad_type"
        case .CITY:
            predefined = "affise_p_city"
        case .COUNTRY:
            predefined = "affise_p_country"
        case .REGION:
            predefined = "affise_p_region"
        case .CLASS:
            predefined = "affise_p_class"
        case .CONTENT:
            predefined = "affise_p_content"
        case .CONTENT_ID:
            predefined = "affise_p_content_id"
        case .CONTENT_LIST:
            predefined = "affise_p_content_list"
        case .CONTENT_TYPE:
            predefined = "affise_p_content_type"
        case .CURRENCY:
            predefined = "affise_p_currency"
        case .CUSTOMER_USER_ID:
            predefined = "affise_p_customer_user_id"
        case .DATE_A:
            predefined = "affise_p_date_a"
        case .DATE_B:
            predefined = "affise_p_date_b"
        case .DEPARTING_ARRIVAL_DATE:
            predefined = "affise_p_departing_arrival_date"
        case .DEPARTING_DEPARTURE_DATE:
            predefined = "affise_p_departing_departure_date"
        case .DESCRIPTION:
            predefined = "affise_p_description"
        case .DESTINATION_A:
            predefined = "affise_p_destination_a"
        case .DESTINATION_B:
            predefined = "affise_p_destination_b"
        case .DESTINATION_LIST:
            predefined = "affise_p_destination_list"
        case .HOTEL_SCORE:
            predefined = "affise_p_hotel_score"
        case .LEVEL:
            predefined = "affise_p_level"
        case .MAX_RATING_VALUE:
            predefined = "affise_p_max_rating_value"
        case .NUM_ADULTS:
            predefined = "affise_p_num_adults"
        case .NUM_CHILDREN:
            predefined = "affise_p_num_children"
        case .NUM_INFANTS:
            predefined = "affise_p_num_infants"
        case .ORDER_ID:
            predefined = "affise_p_order_id"
        case .PAYMENT_INFO_AVAILABLE:
            predefined = "affise_p_payment_info_available"
        case .PREFERRED_NEIGHBORHOODS:
            predefined = "affise_p_preferred_neighborhoods"
        case .PREFERRED_NUM_STOPS:
            predefined = "affise_p_preferred_num_stops"
        case .PREFERRED_PRICE_RANGE:
            predefined = "affise_p_preferred_price_range"
        case .PREFERRED_STAR_RATINGS:
            predefined = "affise_p_preferred_star_ratings"
        case .PRICE:
            predefined = "affise_p_price"
        case .PURCHASE_CURRENCY:
            predefined = "affise_p_purchase_currency"
        case .QUANTITY:
            predefined = "affise_p_quantity"
        case .RATING_VALUE:
            predefined = "affise_p_rating_value"
        case .RECEIPT_ID:
            predefined = "affise_p_receipt_id"
        case .REGISTRATION_METHOD:
            predefined = "affise_p_registration_method"
        case .RETURNING_ARRIVAL_DATE:
            predefined = "affise_p_returning_arrival_date"
        case .RETURNING_DEPARTURE_DATE:
            predefined = "affise_p_returning_departure_date"
        case .REVENUE:
            predefined = "affise_p_revenue"
        case .SCORE:
            predefined = "affise_p_score"
        case .SEARCH_STRING:
            predefined = "affise_p_search_string"
        case .SUBSCRIPTION_ID:
            predefined = "affise_p_subscription_id"
        case .SUCCESS:
            predefined = "affise_p_success"
        case .SUGGESTED_DESTINATIONS:
            predefined = "affise_p_suggested_destinations"
        case .SUGGESTED_HOTELS:
            predefined = "affise_p_suggested_hotels"
        case .TRAVEL_START:
            predefined = "affise_p_travel_start"
        case .TRAVEL_END:
            predefined = "affise_p_travel_end"
        case .USER_SCORE:
            predefined = "affise_p_user_score"
        case .VALIDATED:
            predefined = "affise_p_validated"
        case .ACHIEVEMENT_ID:
            predefined = "affise_p_achievement_id"
        case .COUPON_CODE:
            predefined = "affise_p_coupon_code"
        case .CUSTOMER_SEGMENT:
            predefined = "affise_p_customer_segment"
        case .DEEP_LINK:
            predefined = "affise_p_deep_link"
        case .EVENT_START:
            predefined = "affise_p_event_start"
        case .EVENT_END:
            predefined = "affise_p_event_end"
        case .LAT:
            predefined = "affise_p_lat"
        case .LONG:
            predefined = "affise_p_long"
        case .NEW_VERSION:
            predefined = "affise_p_new_version"
        case .OLD_VERSION:
            predefined = "affise_p_old_version"
        case .PARAM_01:
            predefined = "affise_p_param_01"
        case .PARAM_02:
            predefined = "affise_p_param_02"
        case .PARAM_03:
            predefined = "affise_p_param_03"
        case .PARAM_04:
            predefined = "affise_p_param_04"
        case .PARAM_05:
            predefined = "affise_p_param_05"
        case .PARAM_06:
            predefined = "affise_p_param_06"
        case .PARAM_07:
            predefined = "affise_p_param_07"
        case .PARAM_08:
            predefined = "affise_p_param_08"
        case .PARAM_09:
            predefined = "affise_p_param_09"
        case .PARAM_10:
            predefined = "affise_p_param_10"
        case .REVIEW_TEXT:
            predefined = "affise_p_review_text"
        case .TUTORIAL_ID:
            predefined = "affise_p_tutorial_id"
        case .VIRTUAL_CURRENCY_NAME:
            predefined = "affise_p_virtual_currency_name"
        }
        predefinedParameters.append((predefined, value))
    }

    @objc
    public func apply(closure:(Event) -> ()) -> Event {
        closure(self)
        return self
    }
}
