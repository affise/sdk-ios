import Foundation

/**
 * Manager of Events
 *
 * @property sendDataToServerUseCase the use case sending data to server.
 * @property activityCountProvider the provider observe count of open activity
 */
class EventsManager {
    
    static let TIME_SEND_REPEAT: TimeInterval = 15
    
    private let sendDataToServerUseCase: SendDataToServerUseCase
    private let appLifecycleEventsManager: AppLifecycleEventsManager

    init(sendDataToServerUseCase: SendDataToServerUseCase,
         appLifecycleEventsManager: AppLifecycleEventsManager) {
        
        self.sendDataToServerUseCase = sendDataToServerUseCase
        self.appLifecycleEventsManager = appLifecycleEventsManager
    }
    
    func initialize() {
        subscribeToActivityEvents()
    }
    
    /**
     * Last session count
     */
    private var lastSessionCount = 0

    /**
     * Timer fo repeat send events
     */
    private var timer: Timer?

    /**
     * Subscribe to change activity
     */
    private func subscribeToActivityEvents() {
        //Send events on started
        sendEvents(withDelay: false)
        
        //Start timer fo repeat send events
        startTimer()
        
        appLifecycleEventsManager.addDidEnterBackgroundListener { [weak self] userInfo in
            // Stop timer
            self?.stopTimer()
        }
        
        appLifecycleEventsManager.addWillEnterForegroundListener { [weak self] userInfo in
            //Send events on started
            self?.sendEvents(withDelay: false)
            
            //Start timer fo repeat send events
            self?.startTimer()
        }
    }

    /**
     * Send event
     */
    func sendEvents(withDelay: Bool = true) {
        DispatchQueue.global(qos:.background).sync {
            sendDataToServerUseCase.send(withDelay: withDelay)
        }
    }

    /**
     * Start timer fo repeat send events
     */
    private func startTimer() {
        lockQueue.async(flags: .barrier) {
            //Stop timer if running
            self.stopTimer()
            
            //Create timer
            let timer = Timer(
                timeInterval: EventsManager.TIME_SEND_REPEAT,
                target: self,
                selector: #selector(self.fireTimer),
                userInfo: nil,
                repeats: true
            )
            
            self.setTimer(timer)
            
            DispatchQueue.main.async {
                guard let timer = self.getTimer() else { return }
                RunLoop.current.add(timer, forMode: .common)
            }
        }
    }

    /**
     * Stop timer fo repeat send events
     */
    private func stopTimer() {
        lockQueue.async(flags: .barrier) {
            if self.timer == nil { return }
            self.timer?.invalidate()
            self.timer = nil
        }
    }
    
    @objc
    private func fireTimer() {
        //Send events
        sendEvents()

        //Stop timer
        stopTimer()
    }
        
    private let lockQueue = DispatchQueue(label: "com.affise.EventsManager", attributes: .concurrent)
    
    func getTimer() -> Timer? {
        lockQueue.sync {
            return timer
        }
    }
    
    func setTimer(_ timer: Timer?) {
        lockQueue.async(flags: .barrier) {
            self.timer = timer
        }
    }
}
