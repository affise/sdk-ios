/**
 * When session start.
 *
 * @property affiseSessionCount the count of all sessions.
 * @property lifetimeSessionCount the total application work time milliseconds.
 */
@objc
internal class SessionStartInternalEvent : InternalEvent {
    
    @objc
    public init(
        affiseSessionCount: Int64,
        lifetimeSessionCount: Int64
    ) {
        super.init()
        
        addPropertyRaw(ProviderType.AFFISE_SESSION_COUNT.provider, affiseSessionCount)
        addPropertyRaw(ProviderType.LIFETIME_SESSION_COUNT.provider, lifetimeSessionCount)
    }

    /**
     * Name of event
     *
     * @return name
     */
    public override func getName() -> InternalEventName { return InternalEventName.SESSION_START }
}
