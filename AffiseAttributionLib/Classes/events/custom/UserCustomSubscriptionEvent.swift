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
public class UserCustomSubscriptionEvent : BaseSubscriptionEvent {

    private var customType: String = ""
    private var customSubtype: String = ""

    public init(
        type: String,
        subtype: String,
        data: [(String, Any?)],
        userData: String? = nil
    ) {
        super.init(userData)
        self.data = data
        self.customType = type
        self.customSubtype = subtype
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
}
