import SwiftUI
import AppKit

@available(macOS 12.0, iOS 15, *)
public struct System {
    public static func Unfocus() {
        NSApp.keyWindow?.makeFirstResponder(nil)
    }
}

#if os(iOS)
import UIKit
@available(iOS 15, *)
extension System {
    public static let device: Device = .init()
}

struct Device {
    public let screen: CGRect = UIScreen.main.bounds
}
#endif
