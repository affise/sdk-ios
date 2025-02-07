import Foundation

internal class IndexUseCaseImpl {
    
    private let UUID_INDEX_KEY = "UUID_INDEX_KEY"
    private let AFFISE_EVENT_ID_INDEX_KEY = "AFFISE_EVENT_ID_INDEX_KEY"

    private let preferences: UserDefaults
    private var uuidIndexValue: Int64 = 0
    private var affiseEventIdIndexValue: Int64 = 0

    private let uuidLockQueue = DispatchQueue(label: "com.affise.attribution.uuidIndex", attributes: .concurrent)
    private let idIndexLockQueue = DispatchQueue(label: "com.affise.attribution.affiseEventIdIndex", attributes: .concurrent)

    init(preferences: UserDefaults) {
        self.preferences = preferences
        uuidIndexValue = preferences.value(forKey: UUID_INDEX_KEY) as? Int64 ?? 0
        affiseEventIdIndexValue = preferences.value(forKey: AFFISE_EVENT_ID_INDEX_KEY) as? Int64 ?? 0
    }
}

extension IndexUseCaseImpl: IndexUseCase {

    func getUuidIndex() -> Int64 {
        uuidLockQueue.sync(flags: .barrier) {
            uuidIndexValue += 1
            
            //Save index to preferences
            preferences.set(uuidIndexValue, forKey: UUID_INDEX_KEY)

            return uuidIndexValue
        }
    }

    func getAffiseEventIdIndex() -> Int64 {
        idIndexLockQueue.sync(flags: .barrier) {
            affiseEventIdIndexValue += 1

            //Save index to preferences
            preferences.set(affiseEventIdIndexValue, forKey: AFFISE_EVENT_ID_INDEX_KEY)

            return affiseEventIdIndexValue
        }
    }
}
