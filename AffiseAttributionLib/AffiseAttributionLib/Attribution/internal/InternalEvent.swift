
/**
 * Base internal event
 */

@objc
public class InternalEvent: NSObject {

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
     * Timestamp of event
     *
     * @return timestamp
     */
    func getTimestamp() -> Int64 { return Date().timeIntervalSince1970.timeInMillis }
}
