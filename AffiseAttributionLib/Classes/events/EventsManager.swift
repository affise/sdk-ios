import Foundation

/**
 * Manager of Events
 *
 * @property sendDataToServerUseCase the use case sending data to server.
 * @property activityCountProvider the provider observe count of open activity
 */
class EventsManager {
    
    static let TIME_SEND_REPEAT: TimeInterval = 15
    
    static let SCHEDULER_SEND_REPEAT: TimeInterval = 15
    
    private let sendDataToServerUseCase: SendDataToServerUseCase
    private let appLifecycleEventsManager: AppLifecycleEventsManager

    init(
        sendDataToServerUseCase: SendDataToServerUseCase,
        appLifecycleEventsManager: AppLifecycleEventsManager
    ) {
        
        self.sendDataToServerUseCase = sendDataToServerUseCase
        self.appLifecycleEventsManager = appLifecycleEventsManager
    }
    
    func initialize() throws {
        subscribeToActivityEvents()
        sendEventsOnStop()
    }
    
    /**
     * Last session count
     */
    private var lastSessionCount = 0

    /**
     * Timer fo repeat send events
     */
    private var timer: Timer?
    
    private var scheduler: ScheduledTimer?

    private func sendEventsOnStop() {
        appLifecycleEventsManager.addDidEnterBackgroundListener { [weak self] userInfo in
            self?.sendEvents(withDelay: false, sendEmpty: false)
        }
    }

    /**
     * Subscribe to change activity
     */
    private func subscribeToActivityEvents() {
        //Send events on started
        sendEvents(withDelay: false)
        
        //Start timer fo repeat send events
        startTimer()
        
        //Start scheduler
        startQueue()
        
        appLifecycleEventsManager.addDidEnterBackgroundListener { [weak self] userInfo in
            //Stop timer
            self?.stopTimer()
            
            //Stop scheduler
            self?.stopQueue()
        }
        
        appLifecycleEventsManager.addWillEnterForegroundListener { [weak self] userInfo in
            //Send events on started
            self?.sendEvents(withDelay: false)
            
            //Start timer fo repeat send events
            self?.startTimer()
            
            //Start Scheduler
            self?.startQueue()
        }
    }

    /**
     * Send event
     */
    func sendEvents(withDelay: Bool = true, sendEmpty: Bool = true) {
        DispatchQueue.global(qos:.background).sync {
            sendDataToServerUseCase.send(withDelay: withDelay, sendEmpty: sendEmpty)
        }
    }
    
    /**
     * Send events (if present) on schedule in case network failures
     */
    private func startQueue() {
        scheduler = ScheduledTimer(interval: EventsManager.SCHEDULER_SEND_REPEAT, repeats: true) { [weak self] in
            self?.sendEvents(withDelay: false, sendEmpty: false)
        }
    }
    
    private func stopQueue() {
        scheduler?.stop()
    }

    /**
     * Start timer fo repeat send events
     */
    private func startTimer() {
        DispatchQueue.main.async { [weak self] in
            //Stop timer if running
            self?.stopTimer()
            
            //Create timer
            guard let timer = self?.scheduledTimer() else { return }
            self?.timer = timer
            RunLoop.current.add(timer, forMode: .common)
        }
    }
    
    private func scheduledTimer() -> Timer {
        if #available(iOS 10.0, *) {
            return Timer.scheduledTimer(
                withTimeInterval: EventsManager.TIME_SEND_REPEAT,
                repeats: true
            ) { [weak self] _ in
                self?.fireTimer()
            }
        } else {
            return Timer.scheduledTimer(
                timeInterval: EventsManager.TIME_SEND_REPEAT,
                target: self,
                selector: #selector(self.fireTimer),
                userInfo: nil,
                repeats: true
            )
        }
    }

    /**
     * Stop timer fo repeat send events
     */
    private func stopTimer() {
        if timer == nil { return }
        //Stop timer
        timer?.invalidate()
        timer = nil
    }

    @objc
    private func fireTimer() {
        //Send events
        sendEvents()

        //Stop timer
        stopTimer()
    }
}
