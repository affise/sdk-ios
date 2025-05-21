import AffiseAttributionLib
import Foundation

class AppsFlyerUseCaseImpl: AppsFlyerUseCase {

    private let CATEGORY: String = "appsflyer"

    func logEvent(_ eventName: String, _ eventValues: [String: Any]) {
        UserCustomEvent(eventName: eventName, category: CATEGORY)
            .internalAddRawParameters(eventValues)
            .send()
    }
}
