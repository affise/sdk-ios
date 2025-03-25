import Foundation


internal class FirstAppOpenUseCase {
    
    private let FIRST_OPENED = "FIRST_OPENED"
    private let FIRST_OPENED_DATE_KEY = "FIRST_OPENED_DATE_KEY"
    private let AFF_DEVICE_ID = "AFF_DEVICE_ID"
    private let AFF_ALT_DEVICE_ID = "AFF_ALT_DEVICE_ID"
    
    private let preferences: UserDefaults
    private var firstRun: Bool = false
    private var isFirstOpenValue: Bool = true
    private var persistentApi: AffisePersistentApi? = nil
    
    init(
        preferences: UserDefaults
    ) {
        self.preferences = preferences
        isFirstOpenValue = preferences.value(forKey: FIRST_OPENED) as? Bool ?? true
    }

    func initialize(moduleManager: AffiseModuleManager) {
        persistentApi = moduleManager.api(.Persistent) as? AffisePersistentApi
    }

    /**
     * Check preferences for have first opened date and generate properties if no data
     */
    func onAppCreated() {
        if (preferences.value(forKey: FIRST_OPENED_DATE_KEY) == nil) {
            onAppFirstOpen()
        }

        firstRun = preferences.value(forKey: FIRST_OPENED) as? Bool ?? true
    }

    /**
     * Generate properties on app first open
     */
    private func onAppFirstOpen() {
        //Create first open date
        let firstOpenDate = Date().timeIntervalSince1970

        //Create affDevId
        let affDevId = persistentApi?.getOrCreate(AFF_DEVICE_ID, generateUUID().uuidString.lowercased()) ?? generateUUID().uuidString.lowercased()

        //Create affAltDevId
        let affAltDevId = generateUUID().uuidString.lowercased()

        //Create randomUserId
        let randomUserId = generateUUID().uuidString.lowercased()

        //Save properties
        preferences.set(firstOpenDate, forKey: FIRST_OPENED_DATE_KEY)
        preferences.set(affDevId, forKey: AFF_DEVICE_ID)
        preferences.set(affAltDevId, forKey: AFF_ALT_DEVICE_ID)
        preferences.set(randomUserId, forKey: ProviderType.RANDOM_USER_ID.provider)
        preferences.set(true, forKey: FIRST_OPENED)
    }

    /**
     * Get first open
     * @return is first open
     */
    func isFirstOpen() -> Bool {        
        return isFirstOpenValue
    }

    func completeFirstOpen() {
        isFirstOpenValue = false
        preferences.set(isFirstOpenValue, forKey: FIRST_OPENED)
    }
    
    /**
     * Get first run
     * @return is first run
     */
    func isFirstRun() -> Bool {
        return firstRun
    }

    /**
     * Get first open date
     * @return first open date
     */
    func getFirstOpenDate() -> TimeInterval? {
        guard let value = preferences.value(forKey: FIRST_OPENED_DATE_KEY) as? Double else {
            return nil
        }
        
        return value
    }
    
    /**
     * Get devise id
     * @return devise id
     */
    func getAffiseDeviseId() -> String {
        return preferences.string(forKey: AFF_DEVICE_ID) ?? ""
    }
    
    /**
     * Get alt devise id
     * @return alt devise id
     */
    func getAffiseAltDeviseId() -> String  {return preferences.string(forKey: AFF_ALT_DEVICE_ID) ?? ""}
    
    /**
     * Get random user id
     * @return random user id
     */
    func getRandomUserId() -> String  {return preferences.string(forKey: ProviderType.RANDOM_USER_ID.provider) ?? ""}
}
