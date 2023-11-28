/**
 * Use case to set library preferences
 */
protocol PreferencesUseCase {

    /**
     * Sets Offline mode to [enabled] state
     */
    func setOfflineModeEnabled(enabled: Bool)

    /**
     * Returns state of Offline mode
     */
    func isOfflineModeEnabled() -> Bool

    /**
     * Sets Background Tracking to [enabled] state
     */
    func setBackgroundTrackingEnabled(enabled: Bool)

    /**
     * Returns state of  Background Tracking
     */
    func isBackgroundTrackingEnabled() -> Bool

    /**
     * Sets Tracking to [enabled] state
     */
    func setTrackingEnabled(enabled: Bool)

    /**
     * Returns state of Tracking
     */
    func isTrackingEnabled() -> Bool
}
