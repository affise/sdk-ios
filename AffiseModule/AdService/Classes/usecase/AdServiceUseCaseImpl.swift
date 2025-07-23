import Foundation
import AdServices


class AdServiceUseCaseImpl : AdServiceUseCase {

    var attributionToken: String?

    func initialize() {
        if #available(iOS 14.3, *) {
            attributionToken = try? AAAttribution.attributionToken()
        }
    }

    func getAttributionToken() -> String? {
        return attributionToken
    }
}