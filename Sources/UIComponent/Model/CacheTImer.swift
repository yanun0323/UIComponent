import SwiftUI

@available(iOS 15, macOS 12.0, *)
public class CacheTimer {
    private var timer: Timer?
    private var excutable: Bool
    private var countdown: Int
    private var timeInterval: Double
    private let defaultCountdown: Int
    private var action: () -> Void
    
    public init(countdown: Int, timeInterval: Double, action: @escaping () -> Void) {
        self.timer = nil
        self.countdown = 0
        self.excutable = false
        self.timeInterval = timeInterval
        self.defaultCountdown = countdown
        self.action = action
    }
}

@available(iOS 15, macOS 12.0, *)
extension CacheTimer {
    public func Init() {
        if timer != nil {
            return
        }
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: { _ in
            if self.countdown > 0 {
                self.countdown -= 1
                self.excutable = true
                return
            }
            
            if self.excutable {
                self.action()
                self.excutable = false
            }
        })
    }
    
    public func Refresh() {
        self.countdown = self.defaultCountdown
    }
}
