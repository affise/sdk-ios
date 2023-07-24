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
     * Add predefined [parameter] with [value] type String to event
     */
    @objc
    public func addPredefinedParameter(_ parameter: PredefinedString, string: String) {
        predefinedParameters.append((parameter.value(), string))
    }

    /**
     * Add predefined [parameter] with [value] type Array of String to event
     */
    @objc
    public func addPredefinedParameter(_ parameter: PredefinedListString, listString: [String]) {
        predefinedParameters.append((parameter.value(), listString))
    }

    /**
     * Add predefined [parameter] with [value] type Int64 to event
     */
    @objc
    public func addPredefinedParameter(_ parameter: PredefinedLong, long: Int64) {
        predefinedParameters.append((parameter.value(), long))
    }

    /**
     * Add predefined [parameter] with [value] type Float to event
     */
    @objc
    public func addPredefinedParameter(_ parameter: PredefinedFloat, float: Float) {
        predefinedParameters.append((parameter.value(), float))
    }

    /**
     * Add predefined [parameter] with [value] type JSON to event
     */
    public func addPredefinedParameter(_ parameter: PredefinedObject, object: [(String, Any?)]) {
        predefinedParameters.append((parameter.value(), object))
    }
    /**
     * Add predefined [parameter] with [value] type JSON to event
     */
    @objc
    public func addPredefinedParameter(_ parameter: PredefinedObject, object: [[String: AnyObject]]) {
        addPredefinedParameter(parameter, object: object.toFlatList())
    }

    /**
     * Add predefined [parameter] with [value] type Array of JSON to event
     */
    public func addPredefinedParameter(_ parameter: PredefinedListObject, listObject: [[(String, Any?)]]) {
        predefinedParameters.append((parameter.value(), listObject))
    }

    /**
     * Add predefined [parameter] with [value] type Array of JSON to event
     */
    @objc
    public func addPredefinedParameter(_ parameter: PredefinedListObject, listObject: [[String: AnyObject]]) {
        addPredefinedParameter(parameter, listObject: listObject.toListOfList())
    }

    @objc
    public func apply(closure:(Event) -> ()) -> Event {
        closure(self)
        return self
    }
}
