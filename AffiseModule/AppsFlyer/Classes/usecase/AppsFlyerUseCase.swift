import Foundation
import AffiseAttributionLib


protocol AppsFlyerUseCase {
    func logEvent(_ eventName: String, _ eventValues: [String: Any])
}
