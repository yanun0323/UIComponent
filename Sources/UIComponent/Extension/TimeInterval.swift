import Foundation
import SwiftUI

@available(iOS 15, macOS 12.0, *)
extension TimeInterval {

    public var seconds: Int {
        return Int(self.rounded())
    }
    
    public var days: Int {
        return self.seconds/(60*60*24)
    }

    public var milliseconds: Int {
        return Int(self * 1_000)
    }
}
