import Foundation
import AffiseAttributionLib

@objc(AffisePersistentModule)
public final class PersistentModule: AffiseModule, AffisePersistentApi {
    
    public override var version: String { BuildConfig.AFFISE_VERSION }
    
    lazy var persistentUseCase:PersistentUseCase = PersistentUseCaseImpl()
    
    public func set(_ tag: String, _ value: String) -> Bool {
        return persistentUseCase.set(tag, value)
    }
    
    public func get(_ tag: String) -> String? {
        return persistentUseCase.get(tag)
    }
    
    public func getOrCreate(_ tag: String, _ value: String) -> String {
        return persistentUseCase.getOrCreate(tag, value)
    }
}
