import SwiftUI

@available(iOS 15, macOS 12.0, *)
public class CacheTimer {
  private var timer: Timer?
  private var excutable: Bool
  private var countdown: Int
  private var timeInterval: Double
  private let defaultCountdown: Int
  private var action: () -> Void

    /**
     Create a count down timer that execute the action when countdown reach to zero
     
     - Action will be execute when `Countdown/(1/TimeInterval)` **seconds** passed
     - Call **Activate()** after create timer to activate the timer
     
     - Parameters:
        - countdown:
                    Reduce 1 every timeInterval passed.
                    when countdown reduce to 0, `action` function invokes immediately.
        - timeInterval:
                    The number of seconds. every timeInterval pass, countdown reduce 1.
        - action:
                    A block to be executed when the countdwon reduce to 0.
     
     
     */
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
    /**
     Activate the timer
     
     - This function **WILL NOT** start counting down
     - Call **Refresh()** after **Activate()** to start/refresh counting down
     */
  public func Activate() {
    if timer != nil {
      return
    }
    timer = Timer.scheduledTimer(
      withTimeInterval: timeInterval, repeats: true,
      block: { _ in
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

    /**
     Reset the countdown number and keep counting down
     */
  public func Refresh() {
    self.excutable = true
    self.countdown = self.defaultCountdown
  }

    /**
     Set countdown number to 0 without execute the action
     */
  public func SkipAction() {
    self.excutable = false
    self.countdown = 0
  }
}
