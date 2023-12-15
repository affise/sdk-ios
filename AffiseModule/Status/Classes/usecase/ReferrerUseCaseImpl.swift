import Foundation
import AffiseAttributionLib

internal class ReferrerUseCaseImpl {
    
    let checkStatusUseCase: CheckStatusUseCase?
    var referrer: String? = nil
    private let keyIsOrganic: String = "is_organic"
    private let keyReferrer: String = "referrer"
    private let organic: String = "utm_source=apple-store&utm_medium=organic"

    init(
        checkStatusUseCase: CheckStatusUseCase?
    ) {
        self.checkStatusUseCase = checkStatusUseCase
    }

    func getStatusValue(_ key: String, _ status: [AffiseKeyValue]) -> String? {
        status.first { $0.key == key }?.value
    }
}

extension ReferrerUseCaseImpl: ReferrerUseCase {

    func getReferrer(_ onComplete: @escaping OnReferrerCallback) {
        if referrer != nil {
            onComplete(referrer)
            return
        }
        
        guard let checkStatusUseCase = checkStatusUseCase else {
            onComplete(referrer)
            return
        }
        
        checkStatusUseCase.send { status in
            onComplete(self.parseStatus(status))
        }
    }
    
    func parseStatus(_ status: [AffiseKeyValue]) -> String? {
        if referrer != nil {
            return referrer
        }

        let isOrganic = (getStatusValue(keyIsOrganic, status) as? NSString)?.boolValue ?? false

        if isOrganic {
            referrer = organic
        } else {
            referrer = getStatusValue(keyReferrer, status)
        }
        return referrer
    }
}
