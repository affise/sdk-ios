import Foundation


func delayRun(delay: TimeInterval, execute: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        execute()
    }
}

