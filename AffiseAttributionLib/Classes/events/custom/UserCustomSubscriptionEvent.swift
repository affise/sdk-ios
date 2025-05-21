import Foundation

/**
 * Event UserCustomSubscription 
 *
 * @property type custom event type.
 * @property subtype custom event subtype.
 * @property userData any custom data.
 * @property timeStampMillis the timestamp event in milliseconds.
 */
@objc
open class UserCustomSubscriptionEvent : BaseSubscriptionEvent {

    private var customType: String = ""
    private var customSubtype: String = ""
    private var category: String? = nil

    public init(
        type: String,
        subtype: String,
        data: [(String, Any?)],
        userData: String? = nil,
        category: String? = nil
    ) {
        super.init(userData)
        self.data = data
        self.customType = type
        self.customSubtype = subtype
        self.category = category
    }
    
    @objc
    public convenience init(
        type: String,
        subtype: String,
        data: [[String: AnyObject]],
        userData: String? = nil
    ) {
        self.init(type:type, subtype: subtype,data: data.toFlatList(), userData: userData)
    }
    
    /**
     * Type of event
     */
    override func type() -> String? { return customType }
    
    /**
     * Subtype of event
     */
    public override func subtype() -> String? { return customSubtype }

    override public func getCategory() -> String { return category ?? super.getCategory() }
    
    /**
     * For internal use only
     */
    public func internalAddRawParameters(_ parameters: [String:Any]) -> Event {
        addRawParameters(parameters)
        return self
    }
}
