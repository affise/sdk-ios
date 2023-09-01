import Foundation


import Foundation


/**
 * When session start.
 *
 * @property affiseSessionCount the count of all sessions.
 * @property lifetimeSessionCount the total application work time milliseconds.
 */
@objc
class SessionStartInternalEvent : InternalEvent {
    private let affiseSessionCount: Int64
    private let lifetimeSessionCount: Int64
    
    @objc
    public init(affiseSessionCount: Int64,
                lifetimeSessionCount: Int64) {
        
        self.affiseSessionCount = affiseSessionCount
        self.lifetimeSessionCount = lifetimeSessionCount
    }

    /**
     * Serialize SessionStartInternalEvent to JSONObject
     *
     * @return JSONObject of SessionStartInternalEvent
     */
    override func serialize() -> [(String, Any?)] {
        return [
            (Parameters.AFFISE_SESSION_COUNT, affiseSessionCount),
            (Parameters.LIFETIME_SESSION_COUNT, lifetimeSessionCount)
        ]
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> String { return "SessionStart" }
}
