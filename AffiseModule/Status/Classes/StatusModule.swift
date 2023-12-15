import Foundation
import UIKit
import AffiseAttributionLib

@objc(AffiseStatusModule)
public final class StatusModule: AffiseModule {
    
    private var checkStatusUseCase: CheckStatusUseCase? = nil
    private var referrerUseCase: ReferrerUseCase? = nil
    
    private lazy var stringToKeyValueConverter: StringToKeyValueConverter = StringToKeyValueConverter()
        
    public override func start() {
        guard let providersToJsonStringConverter: ProvidersToJsonStringConverter = get() else { return }
        guard let networkService: NetworkService = get() else { return }

        checkStatusUseCase = CheckStatusUseCaseImpl(
            affiseModule: self,
            logsManager: logsManager,
            networkService: networkService,
            converter: providersToJsonStringConverter,
            keyValueConverter: stringToKeyValueConverter
        )

        referrerUseCase = ReferrerUseCaseImpl(
            checkStatusUseCase: checkStatusUseCase
        )
    }
    
    public override func status(_ onComplete: @escaping OnKeyValueCallback) {
        guard let checkStatusUseCase = checkStatusUseCase else {
            onComplete([])
            return
        }
        checkStatusUseCase.send { status in
            onComplete(status)
            self.referrerUseCase?.parseStatus(status)
        }
    }
}


extension StatusModule : ReferrerCallback {
    public func getReferrer(_ callback: @escaping OnReferrerCallback) {
        referrerUseCase?.getReferrer(callback) ?? callback(nil)
    }
}
