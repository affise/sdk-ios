import Foundation

/**
 * Base Event of Subscription use [data] of event and [userData]
 */
@objc
open class BaseSubscriptionEvent : NativeEvent {
    internal var data: [(String, Any?)] = []
    
    public convenience init(
        data: [(String, Any?)],
        userData: String? = nil
    ) {
        self.init(userData)
        self.data = data
    }
    
    @objc
    public convenience init(
        data: [[String: AnyObject]],
        userData: String? = nil
    ) {
        self.init(data: data.toFlatList(), userData: userData)
    }
    
    /**
     * Type of subscription
     *
     */
    func type() -> String? { return nil }
    
    /**
     * Subtype of subscription
     */
    public func subtype() -> String? { return nil }
     
    override func serializeBuilder() -> AffisePropertyBuilder {
        let result = super.serializeBuilder()
            .addRaw(SubscriptionParameters.AFFISE_SUBSCRIPTION_EVENT_TYPE_KEY.rawValue, value: subtype() ?? "")
        
        for item in data {
            result.addRaw(item.0, value: item.1)
        }
        
        return result
    }
    
    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return type() ?? "" }
}
