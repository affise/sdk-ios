import Foundation
import UIKit
import AffiseAttributionLib

@objc(AffiseStatusModule)
public final class StatusModule: AffiseModule {
    
    private var checkStatusUseCase: CheckStatusUseCase? = nil
    
    private lazy var stringToKeyValueConverter: StringToKeyValueConverter = StringToKeyValueConverter()
        
    public override func initialize() {
        guard let providersToJsonStringConverter: ProvidersToJsonStringConverter = get() else { return }
        guard let networkService: NetworkService = get() else { return }

        checkStatusUseCase = CheckStatusUseCaseImpl(
            affiseModule: self,
            logsManager: logsManager,
            networkService: networkService,
            converter: providersToJsonStringConverter,
            keyValueConverter: stringToKeyValueConverter
        )
    }
    
    public override func status(_ onComplete: @escaping OnKeyValueCallback) {
        checkStatusUseCase?.send(onComplete) ?? onComplete([])
    }
}

