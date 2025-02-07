import Foundation

internal class ScheduledTimer {
    
    private var timer: Timer?
    private let onTimer: () -> Void
    
    init(interval: TimeInterval, repeats: Bool, onTimer: @escaping () -> Void) {
        self.onTimer = onTimer
        
        self.timer = self.scheduledTimer(interval: interval, repeats: repeats)
        
        DispatchQueue.main.async { [weak self] in
            guard let timer = self?.timer else { return }
            RunLoop.current.add(timer, forMode: .common)
        }
    }
    
    func stop() {
        if timer == nil { return }
        //Stop timer
        timer?.invalidate()
        timer = nil
    }

    @objc
    private func onTimerExecute() {
        onTimer()
    }

    private func scheduledTimer(interval: TimeInterval, repeats: Bool) -> Timer {
        if #available(iOS 10.0, *) {
            return Timer.scheduledTimer(
                withTimeInterval: interval,
                repeats: repeats
            ) { [weak self] _ in
                self?.onTimerExecute()
            }
        } else {
            return Timer.scheduledTimer(
                timeInterval: interval,
                target: self,
                selector: #selector(self.onTimerExecute),
                userInfo: nil,
                repeats: repeats
            )
        }
    }
}
