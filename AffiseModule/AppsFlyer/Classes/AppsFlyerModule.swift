import Foundation
import UIKit
import AffiseAttributionLib

@objc(AffiseAppsFlyerModule)
public final class AppsFlyerModule: AffiseModule, AffiseAppsFlyerApi {
    
    public override var version: String { "1.6.50" }
    
    lazy var useCase: AppsFlyerUseCase = AppsFlyerUseCaseImpl()
    
    public override func start() {
    }

    public func hasModule() -> Bool { true }
    
    public func logEvent(_ eventName: String, _ eventValues: [String: Any]) {
        useCase.logEvent(eventName, eventValues)
    }
}
