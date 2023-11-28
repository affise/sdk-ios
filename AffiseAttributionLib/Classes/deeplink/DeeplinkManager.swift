import Foundation
import UIKit

/**
 * Interface describing callback that is going to be triggered when deeplink is received by application
 * Triggered when new deeplink [uri] is received by application with
 */
public typealias OnDeeplinkCallback = (_ url: URL?) -> Void

/**
 * Manager that coordinates deeplink related tasks
 */
protocol DeeplinkManager {
    /**
     * Needs to be called upon app init to properly initialize manager
     */
    func initialize(launchOptions: [UIApplication.LaunchOptionsKey: Any]?)

    /**
     * Sets [callback] to invoke when app receives deeplink
     */
    func setDeeplinkCallback(callback: @escaping OnDeeplinkCallback)

    /**
     * Process [uri] as deeplink
     */
    func handleDeeplink(url: URL?)
}
